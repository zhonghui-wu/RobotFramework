# 配置表  ：  大小写敏感
*** Settings ***
# 引入第三方库
Library  SeleniumLibrary
Library  testCourses

# 用例表  ： 大小写不敏感
*** Test Cases ***
case1
    open browser  http://baidu.com  chrome
    set selenium implicit wait  10
    input text  id=kw   松勤\n
    ${res}=     get text  id=1
    should contain  ${res}  松勤网
    close browser


case2
    # 配置区域--配置项，比如用例的秒杀，用例的标签
    [Documentation]   用例描述--做什么测试的
    [Tags]   比如： 冒烟测试，回归测试等
    # 主题区域--写出用例步骤中的关键字
    log to console   case2


case3
    [Documentation]  引用自己写的函数
    ${course}   courses
    log to console  ${course}

