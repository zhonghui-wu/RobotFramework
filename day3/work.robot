*** Settings ***
Library  lib
Suite Setup  deleteCourse
Suite Teardown  deleteCourse

*** Test Cases ***
case1
    log to console  初始化成功
