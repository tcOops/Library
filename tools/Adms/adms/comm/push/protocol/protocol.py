# -*- coding: utf-8 -*-
__author__ = 'Administrator'

class ResponseCode(object):
    SUCCESS = "OK"
    FAILURE = "406"
    FORBIDDEN = "403"


class QueryCode(object):
    RTLOG = "rtlog"
    RTSTATE = "rtstate"
    OPTIONS = "options"
    TABLEDATA = "tabledata"
    AUTHTYPE= "AuthType"
