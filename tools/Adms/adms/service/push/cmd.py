# -*- coding: utf-8 -*-
__author__ = 'Administrator'

import tornado.web
from adms.device.push.device import ALL_PUSH_DEVICE
from adms.comm.push.protocol.protocol import ResponseCode

class HandleCmdResult(tornado.web.RequestHandler):
    def get(self):
       pass

    def post(self):
        devSn = self.get_argument("SN")
        retCode = ResponseCode.FAILURE
        device = ALL_PUSH_DEVICE.get(devSn, None)
        if device:
            print "---------------dev=", device.ip, ":HandleCmdResult=", self.request.body
        self.write(retCode)


class SendCmd(tornado.web.RequestHandler):
    def get(self):
        self.post()

    def post(self):
        devSn = self.get_argument("SN")
        retCode = ResponseCode.FAILURE
        device = ALL_PUSH_DEVICE.get(devSn, None)
        if device:
            print "------------------dev=", device.ip, ":SendCmd=", self.request.body
            retCode = ResponseCode.SUCCESS
        self.write(retCode)