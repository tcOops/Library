import socket
import threading, logging
import time, os
import MySQLdb
log_file_path = os.getcwd()

class service(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)
        self.host = socket.gethostname()
        self.port = 23333
        self.pushDb = pushDB()

    def run(self):
        service = socket.socket()
        service.bind((self.host, self.port))
        service.listen(5) #Max connection number

        cnt = 1
        try:
            while True:
                print "waiting for connection ..."
                con, addr = service.accept()
                print "connection from {0}".format(addr)
                data = str(con.recv(1024))

                pieces = data.split(';')
                print "Round{0}, the received data is {1}".format(str(cnt), pieces)
                cnt += 1
                for each in pieces:
                    if not each: break
                    ip_port, signal_code = each.split()
                    ip, port = ip_port.split(':')
                    print ip_port, signal_code
                    now = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
                    sql = "insert into rfidrecord(action_date, signal_code, ip, is_deleted) values('{0}', '{1}', '{2}', {3})".format(now, signal_code, ip, '0')
                    self.pushDb.push(sql)
                con.close()
            self.pushDb.db.close()

        except Exception, e:
            print e
        else:
            pass

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
            print sql
            self.cursor.execute(sql)
            self.db.commit()
        except Exception, e:
            print e
            self.db.rollback()
        finally:
            pass

if __name__ == "__main__":
    work = service()
    work.start()
