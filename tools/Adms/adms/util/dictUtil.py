# -*- coding: utf-8 -*-
__author__ = 'Administrator'

def strToDict(str):
    str = "{'" + str.replace("=", "':'").replace(",", "','") + "'}"
    return eval(str)