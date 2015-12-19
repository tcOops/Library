# -*- coding: utf-8 -*-
__author__ = 'Administrator'

import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
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

application = tornado.web.Application([
    (r"/", MainHandler),
])

if __name__ == "__main__":
    application.listen(8888)
    tornado.ioloop.IOLoop.instance().start()
