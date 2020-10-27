*** Settings ***
Library  testlib.py

*** Test Cases ***
常用关键字1
    #  log打印在日志里面，log to console会输出控制台
    log  hello
    log to console  hello world
    # log many  是在日志里打印多个内容
    log many  我\ 不   是    谁


传递参数2
    # 定义变量    set variable得到的是 str
    ${var1}  set variable  2020
#    log to console  ${var1}
    # 这个是定义一个浮点数
    ${num}  convert to number  1111
    # 这个数定义一个 整数
    ${int}  convert to integer  1123
    # 引用第三方库的函数
    ${type}  get type  ${num}
    ${sum}   get sum  ${num}
    log to console  ${type}
    log to console  ${sum}


常用关键字3--断言
    ${msg}  set variable  hello
    # 判断内容是否相等
#    should be equal  ${msg}  2020
#    should be equal  ${msg}  ${2020}
    # 判断类型是否相等
#    should be equal as integers  ${msg}  2020
    # 判断两个值是否相等时  可以用到下面的方法
    should be true  'hello'==$msg
    should be true  'hel' in 'hello'