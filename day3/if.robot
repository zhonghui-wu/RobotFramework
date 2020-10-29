*** Settings ***
Library  test
*** Test Cases ***
#判断1
#    ${n}   num
#    run keyword if  '2020' in $n  log to console  判断成功
#    # 判断不成功则不打印
#    run keyword if  '2' in $n and '0' in $n
#    # ...加两个空格可以接着上一行输出
#    ...  log to console


#判断2 if--else
#    ${n}   num
#    run keyword if  '2020' in $n  log to console  判断成功   ELSE
#    ...  log to console  判断不成功


判断3-else-if
    ${n}   num
    run keyword if  '2021' in $n  log to console  判断成功
    ...  ELSE IF   '11' in $n   log to console   现在是10
    ...  ELSE IF   'JUN1' in $n   log to console  现在是9月
    ...  ELSE   log to console  不知道输出什么