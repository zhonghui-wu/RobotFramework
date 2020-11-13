*** Settings ***
Library  lib
Library  SeleniumLibrary
*** Test Cases ***
test1
    [Setup]  deleteAllCourse
    login
    addCourse  语文  初中语文   1
    checkCourse  语文
    close browser
*** Keywords ***
login
    open browser  http://127.0.0.1/mgr/login/login.html  chrome
    set selenium implicit wait  10
    # 这里没有输入账号密码的操作是因为浏览器缓存了账号密码
    click element  css=.btn-success


addCourse
    # [Arguments]  是用来声明变量的
    [Arguments]  ${name}   ${desc}   ${display_idx}
    click element  css=.btn-md
    input text  css=[ng-model="addData.name"]  ${name}
    input text  css=[ng-model="addData.desc"]  ${desc}
    input text  css=[ng-model="addData.display_idx"]   ${display_idx}
    click element  css=[ng-click="addOne()"]


checkCourse
    [Arguments]  ${enterCourse}
    ${courseName}  get text  xpath=//td[2]/span
    should be true  $enterCourse==$courseName
    log to console  课程增加成功