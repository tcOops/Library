#!/usr/bin/env python
# -*- coding: utf-8 -*-

import SocketServer
from SocketServer import StreamRequestHandler as HD
import threading, logging
import time, os
import MySQLdb
import subprocess
log_file_path = os.getcwd()

host = 'localhost'
port = 8000

class Server(HD):
    def handle(self):
        pushDb = pushDB()
        print "waiting for connection"
        cnt = 1
        while True:
            data = self.request.recv(1024)
            if not data:
                break
            print data

            response = 'ok'
            self.request.send(response)
            pieces = data.split('\t')
            print "Round {0}:   The received data is {1}\n\n".format(str(cnt), pieces)
            cnt += 1
            data = '''ip=192.168.1.1\ttime=2013-12-28 10:04:18\tpin=0\tcardno=CBCA937E000104E0\teventaddr=1\t
                    event=27E\tinoutstatus=0\tverifytype=4'''

            action, actionDate, signalCode, doorIp, generateDate, isDeleted = ['']*6
            for each in pieces:
                if not each: break
                key, val = each.split('=')
                if key == 'time':
                    actionDate = val
                if key == 'cardno':
                    signalCode = val
                if key == 'inoutstatus':
                    action = 'open' if val=='0' else 'close'
                if key == 'ip':
                    doorIp = val

                generateDate = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
            sql = "insert into doorrecord(action, action_date, signal_code, door_ip, generate_date, is_deleted) values('{0}', '{1}', '{2}', {3})".format(action, action_date, signal_code, doorIp, generateDate, '0')
            pushDb.push(sql)

        pushDb.db.close()

class pushDB:
    def __init__(self):
        self.host = "localhost"
        self.user = "root"
        self.password = ""
        self.port = 3306
        self.db = "library_atm"
        self.charset = "utf8"

        self.db = MySQLdb.connect(
            host=self.host,
            port = self.port,
            user = self.user,
            passwd = self.password,
            db = self.db,
            charset = self.charset
        )
        self.cursor = self.db.cursor()

    def push(self, sql):
        try:
            self.cursor.execute(sql)
            self.db.commit()
        except Exception, e:
            print e
            self.db.rollback()
        finally:
            pass

if __name__ == '__main__':
    server = SocketServer.ThreadingTCPServer((host, port), Server)
    server.serve_forever()
