# -*- coding:utf-8 -*-
# _author_:wuzhonghui
# 2020/10/30

import requests


def add(name, desc, display_idx):
    payload = {
        "action": "add_course",
        "data": f'''{{
            "name":"{name}",
            "desc":"{desc}",
            "display_idx":"{display_idx}"
    }}'''
    }
    header = {"Content-Type": "application/x-www-form-urlencoded"}

    response = requests.post(f'http://127.0.0.1/api/mgr/sq_mgr/', headers=header, data=payload)
    try:
        return response.json()
    except:
        return {'retcode': 777, 'reason': '项目异常'}


def lists(pagenum, pagesize):
    headers = {"Content-Type": "application/json"}
    payload = {"action": "list_course", "pagenum": pagenum, "pagesize": pagesize}
    response = requests.get(f'http://127.0.0.1/api/mgr/sq_mgr/', headers=headers, params=payload)
    try:
        return response.json()
    except:
        return {'retcode': 777, 'reason': '项目异常'}


# print(list(1,10))


def delete(id):
    header = {'Content-Type': 'application/x-www-form-urlencoded'}
    payload = {"action": "delete_course", "id": id}
    response = requests.delete(f'http://127.0.0.1/api/mgr/sq_mgr/', headers=header, data=payload)
    try:
        return response.json()
    except:
        return {'retcode': 777, 'reason': '项目异常'}


def deleteCourse():
    retLists = lists(1, 100)
    num = 0
    for msg in retLists['retlist']:
        delete(msg['id'])
        num = num + 1
    print('本次共删除了', num, '条数据')
    return


deleteCourse()
# add(1,1,1)
print(len(lists(1,1)['retlist']))