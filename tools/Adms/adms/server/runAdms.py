# -*- coding: utf-8 -*-
__author__ = 'Administrator'

import tornado
from adms.router.push.routerTable import application

class RunAdms(object):
    def start(self):
        application.listen(8099)
        tornado.ioloop.IOLoop.instance().start()



if __name__ == "__main__":
    RunAdms().start()