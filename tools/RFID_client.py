import socket
import time

if __name__ == '__main__':
    s = socket.socket()

    host = socket.gethostname()
    port = 23333

    s.connect((host, port))

    cnt = 0
    while True:
        data, cnt = "192.168.2.190:10010 CBCA937E000104E0;", cnt+1
        s.send(data)
        print "next round ...", cnt
        if cnt > 20:
            break
        time.sleep(0.5)
