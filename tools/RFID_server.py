#!/usr/bin/env python
# -*- coding: utf-8 -*-

import SocketServer
from SocketServer import StreamRequestHandler as HD
import threading, logging
import time, os
import MySQLdb
log_file_path = os.getcwd()

host = '192.168.1.111'
port = 1001

ipList = {
    '11' : '192.168.1.190'
}

class Server(HD):
    def handle(self):
        pushDb = pushDB()
        print "waiting for connection"
        dataSplit = ''
        cnt = 1

        bookSignalCode, opTime = '', -1
        while True:
            data = self.request.recv(1024)
            if not data:
                break
            #print data

            response = 'ok'
            self.request.send(response)
            pieces = data.split(';')
            print "Round{0}, the received data is {1}".format(str(cnt), pieces)

            dataSplit += data

            if len(pieces) > 1:
                print '-----------!!!!!!!!!!!'
                print dataSplit
                print '-----------!!!!!!!!!!!'
                print ''
                cnt += 1
                for each in dataSplit.split(";"):
                    if not each: break
                    ip_port, signal_code = each.split(',')
                    #ip = ipList[ip_port]
		    sql = "select rfid_ip from bookstorelocation where code = '{0}'".format(ip_port)
		    pushDb.cursor.execute(sql)
        	    data = pushDb.cursor.fetchone()
		    ip = str(data[0])
                    now = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
                    sql = "insert into rfidrecord(action_date, signal_code, ip, is_deleted, is_demo) values('{0}', '{1}', '{2}', {3}, {4})".format(now, signal_code, ip, 0, 0)

                    diff, nt = 10, time.time()
                    if opTime != -1:
                        diff = nt - opTime if opTime < nt else opTime - nt
                    if bookSignalCode == signal_code and diff <= 1.0:
                        pass
                    else: pushDb.push(sql)

                    opTime, bookSignalCode = nt, signal_code

                dataSplit = ''
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
