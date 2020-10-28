# -*- coding:utf-8 -*-
# _author_:wuzhonghui
# 2020/10/28

import requests


def get_course():

    rsp = requests.get('http://127.0.0.1/api/mgr/sq_mgr/?action=list_course&pagenum=1&pagesize=20').json()

    return rsp['retlist']


# for i in get_course():
#     print(type(i))

# print(*get_course())0