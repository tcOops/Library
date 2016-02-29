﻿#  -*- coding: utf-8 -*-
__author__ = 'Administrator'

import sys
reload(sys)
sys.setdefaultencoding("utf-8")

import tornado.web
from adms.device.push.device import ALL_PUSH_DEVICE
from adms.comm.push.protocol.protocol import ResponseCode, QueryCode
import MySQLdb
import time

ipList = {
    '192.168.1.21' : '192.168.1.190'
}

class pushDB(object):
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


    def getTime(self, sql):
        try:
            self.cursor.execute(sql)
            data = self.cursor.fetchone()
            if not data:
                return []
            return [data[0], data[1], data[2], data[3]]
        except Exception, e:
            print e
        finally:
            pass

    def handle(self, doorIp, dateOpen, dateClose,  readerCode, actionDate):
        rfidIp, locationId, locationName = '', 0, ''
        sql = "select rfid_ip, id, location from bookstorelocation where door_ip = '{0}'".format(doorIp)
        self.cursor.execute(sql)
        data = self.cursor.fetchone()
        if data:
            rfidIp = str(data[0])
            locationId = int(data[1])
            locationName = str(data[2])
        sql = "select signal_code, action_date from rfidrecord where action_date >= '{0}' and action_date <= '{1}' and ip= '{2}'".format(dateOpen, dateClose, rfidIp)
        try:
            self.cursor.execute(sql)
            data = self.cursor.fetchall()
            statical = {} #
            bookCodeRes, actionDateRes = '-1', ''
            for each in data:
                bookCode, actionDate = each[0], each[1]
                t1 = time.mktime(time.strptime(actionDate,'%Y-%m-%d %H:%M:%S'))
                if not actionDateRes: t2 = t1 + 3
                else: t2 = time.mktime(time.strptime(actionDateRes,'%Y-%m-%d %H:%M:%S'))

                diff = t2 - t1 if t1 < t2 else t1 - t2
                if bookCode == bookCodeRes and diff <= 1:
                    pass
                else:
                    if bookCode not in statical:
                        statical[bookCode] = 1
                    else:
                        statical[bookCode] += 1
                    bookCodeRes, actionDateRes = bookCode, actionDate

            sql0 = "select name from reader where student_card_number = '{0}'".format(readerCode)
            self.cursor.execute(sql0)
            data = self.cursor.fetchone()
            readerName = data[0]

            print '本次操作所有的借书情况： ', statical
            for key in statical:
                sql1 = "select status, name from book where signal_code = '{0}'".format(key)
                self.cursor.execute(sql1)
                data = self.cursor.fetchone()
                originalSta = 0 #在馆
                if data:
                    bookName = data[1]
                if data and data[0] == '不在馆': #book in door
                    originalSta = 1

                if data and originalSta and statical[key] & 1:#signal_code == reader_id
                    sql2 = """insert into circulation(book_id, signal_code, action_time, action_type, is_deleted, reader_name, book_name, loction_name, location_id)
                     values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')""".format(key, readerCode, actionDate, '还书', 0, readerName, bookName, locationName, locationId)
                    self.cursor.execute(sql2)
                    self.db.commit()
                    sql3 = "update book set status = '在馆', location_id = {1} where signal_code = '{0}'".format(key, locationId) #可以实现多地还书， 只要设置book的locaitonId即可

                    self.cursor.execute(sql3)
                    self.db.commit()

                if data and (originalSta == 0) and statical[key] & 1:#signal_code == reader_id
                    sql2 = """insert into circulation(book_id, signal_code, action_time, action_type, is_deleted,  reader_name, book_name, loction_name, location_id)
                     values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')""".format(key, readerCode, actionDate, '借书', 0, readerName, bookName, locationName, locationId)
                    self.cursor.execute(sql2)
                    self.db.commit()
                    sql3 = "update book set status = '不在馆' where signal_code = '{0}'".format(key)
                    self.cursor.execute(sql3)
                    self.db.commit()

        except Exception, e:
            print e
        finally:
            pass


    def handleCirculation(self, ip, begtime):
        sql = 'select action_date from doorrecord where ip = {0} order by id desc limit 2'.format(ip)
        self.cursor.execute(sql)
        data = self.cursor.fetchall()
        endtime = str(data[1][0])
        pass

class ReceiveData(tornado.web.RequestHandler):
    RTLOG_QUEUE = []
    def __int__(self):
        super.__init__()
        self.data = None
        self.device = None

    def get(self):
      self.post()

    def post(self):
        print "------------1------"
        devSn = self.get_argument("SN")
        retCode = ResponseCode.SUCCESS
        self.device = ALL_PUSH_DEVICE.get(devSn,None)
        if self.device:
            self.data = self.request.body
            query = self.get_argument("table", None)
            query = query and query or (not self.get_arguments(QueryCode.AUTHTYPE, None) and QueryCode.AUTHTYPE or None)
            if query == QueryCode.RTLOG:
                retCode = self.rtLog()
            elif query == QueryCode.RTSTATE:
                retCode = self.rtState()
            elif query == QueryCode.OPTIONS:
                retCode = self.devParams()
            elif query == QueryCode.TABLEDATA:
                retCode = self.tableData()
            elif query == QueryCode.AUTHTYPE:
                retCode = self.remoteVerify()
        self.write(retCode)

    def rtLog(self):
        event = "-------dev=" + self.device.ip + ":rtLog=" + self.data
        print event
        ReceiveData.RTLOG_QUEUE.append(event)

        pieces = self.data.split()
        pieces[0] = pieces[0] + ' ' + pieces[1]
        actionTime = pieces[0].split('=')[1]
        print '!!!!!!!!!!!!!!!!', actionTime
        signalCode = pieces[3].split('=')[1]
        ip = self.device.ip
        now = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))

        if int(signalCode) != 0:
            pushDb = pushDB()
            sql = '''insert into doorrecord(action, action_date, signal_code,
             door_ip, generate_date, is_deleted, is_demo) values('{0}', '{1}', '{2}', '{3}', '{4}', {5}, {6})'''.format('open', actionTime, signalCode, ip, now, 0, 0)
            pushDb.pushDoorInfo(sql)
        return ResponseCode.SUCCESS

    def rtState(self):
        print "-------dev=", self.device.ip, ":rtState=", self.data

        pieces = self.data.split()
        sta = pieces[2].split('=')[1] #根据sensor的数值来判断状态， 01表示关门， 02表示开门
        ip = self.device.ip

        pushDb = pushDB()
        if sta == '01': #关门， 首先判断当前数据库里面是不是开着门的状态？ 如果不是， 说明是垃圾数据
            sql = "select action_date, action, signal_code, generate_date from doorrecord where door_ip = '{0}' order by id desc limit 1".format(ip)
            data = pushDb.getTime(sql)
            if data and data[1] == 'open':
                #openTime = pushDb.getTime(sql)
                openTime = data[0]
                pieces[0] = pieces[0] + ' ' + pieces[1]
                nowTime = pieces[0].split('=')[1]
                signalCode = data[2]
                systemNowTime = data[3]

                t1 = time.mktime(time.strptime(nowTime,'%Y-%m-%d %H:%M:%S'))
                t2 = time.mktime(time.strptime(openTime,'%Y-%m-%d %H:%M:%S'))

               # diff = t1 - t2 if t2 < t1 else t2 - t1

               # if diff > 8 or diff < 3: # not the delay time, but the action for closing
                now = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time())) #当前时间， 在处理的时候以服务器上的时间为准
                sql = '''insert into doorrecord(action, action_date, signal_code,
         door_ip, generate_date, is_deleted, is_demo) values('{0}', '{1}', '{2}', '{3}', '{4}', {5}, {6})'''.format('close', nowTime, signalCode, ip, now, 0, 0)
                pushDb.pushDoorInfo(sql)
                pushDb.handle(ip, systemNowTime, now, signalCode, now)
        elif sta == '02': #开门
            pass
        return ResponseCode.SUCCESS

    def devParams(self):
        print "-------dev=", self.device.ip, ":params=", self.data
        return ResponseCode.SUCCESS

    def tableData(self):
        print "-------dev=", self.device.ip, ":tableData=", self.data
        return ResponseCode.SUCCESS

    def remoteVerify(self):
         print "-------dev=", self.device.ip, ":remoteVerify=", self.data
         return ResponseCode.SUCCESS

