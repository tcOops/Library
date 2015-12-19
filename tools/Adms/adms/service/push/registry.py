# -*- coding: utf-8 -*-
__author__ = 'Administrator'
import tornado.web
from adms.util.dictUtil import strToDict
from adms.device.push.device import Device, ALL_PUSH_DEVICE
from hashlib import sha1
import os
import time

SESSION = lambda: sha1('%s%s' % (os.urandom(16), time.time())).hexdigest()


class Registry(tornado.web.RequestHandler):
    def get(self):
        html = """<html>
                    <body>
                        <div>
                            <div id="bgDiv" style="width:59%; height: 100%; float: left; top: -84.5px; left: 0px; opacity: 1; background-image: url(&quot;http://www.bing.com/az/hprichbg/rb/DolomitesCloudsVideo_ROW9007702426_1366x768.jpg&quot;); visibility: visible;" class=" sw_imLd">
                            </div>
                            <div id="bgDiv" style="width: 41%; height: 100%; float: left; top: -146px; left: 0px; opacity: 1; background-image: url(&quot;http://s.cn.bing.net/az/hprichbg/rb/GivernyGardenSpring_ZH-CN10810313305_1920x1080.jpg&quot;); visibility: visible;" class=" sw_imLd">
                            </div>
                        </div>
                    </body>
                </html>"""
        self.write(html)
        #self.redirect('http://127.0.0.1:8080', permanent=True)

    def post(self):
        devSn = self.get_argument("SN")
        device = ALL_PUSH_DEVICE.get(devSn, None)
        if not device:
            devParams = strToDict(self.request.body)
            device = Device(devSn, devParams['DeviceType'], devParams['IPAddress'], devParams['FirmVer'], devParams['IPAddress'], 4370, devParams['~DeviceName'], SESSION())
            ALL_PUSH_DEVICE.setdefault(devSn,device)
        registryCode = "RegistryCode=" + devSn
        print "------------registryCode="+registryCode
        self.write(registryCode)