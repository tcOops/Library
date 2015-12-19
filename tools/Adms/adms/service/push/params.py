# -*- coding: utf-8 -*-
__author__ = 'Administrator'

import tornado.web
from adms.device.push.device import ALL_PUSH_DEVICE
from adms.comm.push.protocol.protocol import ResponseCode

class SetDevCommParams(tornado.web.RequestHandler):
    def get(self):
        print "-----fffffffffffff"
        self.post()
       #pass

    def post(self):
        print "-------ggggggg"
        devSn = self.get_argument("SN")
        if ALL_PUSH_DEVICE.has_key(devSn):
            device = ALL_PUSH_DEVICE.get(devSn)
            devParams = """"ServerVersion=3.0.1\nServerName=ADMS\nPushVersion=3.0.1\nErrorDelay=60\nRequestDelay=2\nTransTimes=00:00\t14:00\nTransInterval=1"
                            \nTransTables=User\tTransaction\nRealtime=1\nSessionID=%s\nTimeoutSec=10"""%device.session
            self.write(devParams)
        else:
            self.write(ResponseCode.FAILURE)