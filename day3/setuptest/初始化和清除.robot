*** Settings ***
Suite Setup   log to console   执行套件初始化
Suite Teardown  log to console   执行套件清除
Test Setup  log to console   执行默认初始化
Test Teardown  log to console   执行默认清除
*** Test Cases ***
case1
    log to console  1111


case2
    log to console  22222


case3
    log to console  3333