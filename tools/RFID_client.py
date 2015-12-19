from socket import *
import time

host = "192.168.1.15"
port = 1001

if __name__ == '__main__':
    bufsize = 1024
    addr = (host,port)
    client = socket(AF_INET,SOCK_STREAM)
    client.connect(addr)


    cnt = 0
    while True:
        data = "192.168.2.190:10010 CBCA937E000104E0;"
        cnt += 1
        if not data or data=='exit':
            break
        client.send(data)
        data = client.recv(100)
        if not data:
            break
        print data.strip()
        if cnt >= 20:
            break
        time.sleep(1)
    client.close()
