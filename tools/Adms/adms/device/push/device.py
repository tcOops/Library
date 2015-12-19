# -*- coding: utf-8 -*-
__author__ = 'Administrator'

ALL_PUSH_DEVICE = {}

class Device(object):
    def __init__(self, sn, module, name, firmVer, ip, port, type, session):
        self.sn = sn
        self.module = module
        self.name = name
        self.firmVer = firmVer
        self.ip = ip
        self.port = port
        self.type = type
        self.session = session
