# -*- coding: utf-8 -*-
__author__ = 'Administrator'
import tornado.web

class RTLOG(tornado.web.RequestHandler):
    def get(self):
        self.render("rtlog.html")

    def post(self):
        pass