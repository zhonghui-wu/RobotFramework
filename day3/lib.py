# -*- coding:utf-8 -*-
# _author_:wuzhonghui
# 2020/10/30

import requests, time
from selenium import webdriver


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
        return response.json()['retlist']
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
    for msg in retLists:
        delete(msg['id'])
        num = num + 1
    print('本次共删除了', num, '条数据')
    return


def deleteAllCourse():
    driver = webdriver.Chrome()
    driver.get('http://127.0.0.1/mgr/login/login.html')
    driver.implicitly_wait(5)
    '''这里是浏览器记住了账号密码，所以不需要输入账号密码了'''
    # driver.find_element_by_id('username').send_keys('auto')
    # driver.find_element_by_id('password').send_keys('sdfsdfsdf')
    driver.find_element_by_css_selector('.btn-success').click()
    '''由于每次删除一个课程后，整个列表都会重新刷新，所以for循环不可用。只能使用while循环一直获取列表
    # courses = driver.find_elements_by_css_selector('[total-items="totalNum"]')
    # for i in courses:
    #     # time.sleep(3)
    #     i.find_element_by_css_selector('[ng-click="delOne(one)"]').click()
    #     driver.find_element_by_css_selector('.btn-primary').click()
    #     time.sleep(1)
    # 
    # print('课程删除完成')'''
    while True:
        allDel = driver.find_elements_by_css_selector('[ng-click="delOne(one)"]')
        if not allDel:
            print('课程全部删除成功')
            break
        allDel[0].click()
        driver.find_element_by_css_selector('.btn-primary').click()
        time.sleep(1)

    driver.quit()


if __name__ == '__main__':

    deleteAllCourse()
    # deleteCourse()
    # add(1,1,1)
    # a = lists(1,1)
    # print(type(a[0]['name']))


