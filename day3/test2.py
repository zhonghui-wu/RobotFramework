# -*- coding:utf-8 -*-
# _author_:wuzhonghui
# 2020/10/29
from selenium import webdriver

def courses(a):
    if int(a) >=60:
        print('及格啦')
    else:
        print('继续努力吧')


# courses(1)

def drivers():
    dri = webdriver.Chrome()
    return dri