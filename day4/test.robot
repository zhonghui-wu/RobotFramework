*** Settings ***
Library  SeleniumLibrary
Resource  lib2.robot
Suite Setup  login
Suite Teardown  deleteAllCourse
*** Test Cases ***

新增课程1
    addCourse  语文  初中语文  2

新增课程2
    addCourse  数学  初中数学  1
    sleep  1

课程校验
    checkCourses  语文  数学
