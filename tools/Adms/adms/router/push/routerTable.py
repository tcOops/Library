# -*- coding: utf-8 -*-
__author__ = 'Administrator'
import tornado.web
from adms.service.push.registry import Registry
from adms.service.push.cmd import HandleCmdResult, SendCmd
from adms.service.push.receive import ReceiveData
from adms.service.push.query import QueryData
from adms.service.push.upgrade import UpgradeFirmware
from adms.service.push.params import SetDevCommParams
import os
from adms.web.rtlog import RTLOG


settings = {
    "static_path" : os.path.join(os.path.dirname(__file__), "browse%sstatic"%os.sep),
    "template_path" : os.path.join(os.path.dirname(__file__), "browse%stemplates"%os.sep),
    "gzip" : True,
    "debug" : True,
}

application = tornado.web.Application([
    (r"/iclock/registry", Registry),
    (r"/iclock/push", SetDevCommParams),
    (r"/iclock/cdata", ReceiveData),
    (r"/iclock/querydata", QueryData),
    (r"/iclock/getrequest", SendCmd),
    (r"/iclock/devicecmd", HandleCmdResult),
    (r"/iclock/file", UpgradeFirmware),
    (r"/rtlog", RTLOG)
], **settings)
