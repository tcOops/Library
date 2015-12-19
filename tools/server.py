#!/usr/bin/env python
# -*- coding: utf-8 -*-

import SocketServer
from SocketServer import StreamRequestHandler as HD
import threading, logging
import time, os
import MySQLdb
import subprocess
log_file_path = os.getcwd()

host = '192.168.1.111'
port = 8099

class Server(HD):
    def handle(self):
        pushDb = pushDB()
        print "waiting for connection"
        cnt = 1

        tt = 1
        while True:
            data = self.request.recv(1024)
            if not data:
                break
            print data

            rdata = data.split('\n')
            firstPart = rdata[0]
            rcode = ''
            print 'Round {0}'.format(str(tt))
            if 'SN' in firstPart:
                print 'first commit'
                rcode = firstPart[firstPart.find('SN')+3 :].split('&')[0]

                retCode = "registry=ok\nRegistryCode={0}\n".format('1234567')
                retCode += "ServerVersion=3.1.1\n"
                retCode += "ServerName=ADMS\n"
                retCode += "PushVersion=3.2.0\n"
                retCode += "ErrorDelay=60\n"
                retCode += "RequestDelay=5\n"
                retCode += "TransTimes=00:00 14:00\n"
                retCode += "TransInterval=1\n"
                retCode += "TransTables=User Transaction\n"
                retCode += "Realtime=1\n"
                retCode += "SessionID=h2kgbpcm2x\n"
                print retCode
                self.request.send(retCode)
            else:
                response = 'ok'
                self.request.send(response)

                pieces = data.split('\t')
                print "Round {0}:   The received data is {1}\n\n".format(str(cnt), pieces)
                cnt += 1


"""
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
            sql = "insert into doorrecord(action, action_date, signal_code, door_ip, generate_date, is_deleted) values('{0}', '{1}', '{2}', '{3}', '{4}', {5})".format(action, action_date, signal_code, doorIp, generateDate, '0')
            pushDb.pushDoorInfo(sql)
"""
        #pushDb.db.close()


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

    def pushDoorInfo(self, sql):
        try:
            self.cursor.execute(sql)
            self.db.commit()
        except Exception, e:
            print e
            self.db.rollback()
        finally:
            pass

    def handleCirculation(self, ip, begtime):
        sql = 'select action_date from doorrecord where ip = {0} order by id desc limit 2'.format(ip)
        self.cursor.execute(sql)
        data = self.cursor.fetchall()
        endtime = str(data[1][0])

        sql = "select * from rfidrecord where "
        pass

if __name__ == '__main__':
    server = SocketServer.ThreadingTCPServer((host, port), Server)
    server.serve_forever()
