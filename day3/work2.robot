*** Settings ***
Library  lib
Library  SeleniumLibrary

*** Test Cases ***
case1
    [Setup]   deleteAllCourse
    ${listCourse}  lists  1  60
    # 定义一个空 list ，如果listCourse等于list的时候就说明课程清除干净了
    ${lists}  create list
    run keyword if  ${lists}==${listCourse}   log to console   课程初始化成功
    ...  ELSE  log to console  初始化失败，请查看 deleteAllCourse 函数代码
    open browser  http://127.0.0.1/mgr/login/login.html  chrome
    set selenium implicit wait  10
    click element  css=.btn-success
    click element  css=.btn-md
    input text  css=[ng-model="addData.name"]  语文
    input text  css=[ng-model="addData.desc"]  初中语文
    input text  css=[ng-model="addData.display_idx"]   1
    click element  css=[ng-click="addOne()"]
    ${msg}  get webelements  css=[total-items="totalNum"]
    should be true  $lists!=$msg
    log to console  增加课程测试通过
    close browser

