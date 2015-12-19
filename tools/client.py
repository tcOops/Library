from socket import *
import time

host = "192.168.1.111"
port = 8000

if __name__ == '__main__':
    bufsize = 1024
    addr = (host,port)
    client = socket(AF_INET,SOCK_STREAM)
    client.connect(addr)


    cnt = 0
    while True:
        data = '''time=2013-12-28 10:04:18\tpin=0\tcardno=CBCA937E000104E0\teventaddr=1\t
                event=27E\tinoutstatus=0\tverifytype=4'''
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
