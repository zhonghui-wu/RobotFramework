*** Settings ***
Variables  lib/config.py
Library  SeleniumLibrary
*** Test Cases ***
case1
    #  引用config文件里的 变量
    open browser  ${libPath}  chrome