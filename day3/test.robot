*** Settings ***
Library  lib.py

*** Test Cases ***
case1
    ${a}  lists  1  60
    log to console  '${a[0]['name']}'