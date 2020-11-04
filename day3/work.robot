*** Settings ***
Library  lib
Library  Dialogs   #  RF库，用于用户交互，如此输入框
Suite Setup  deleteCourse
Suite Teardown  deleteCourse

*** Test Cases ***
case1
    ${listCourse}  lists   1  60
    # 定义一个空列表，如果 retlist 为空，则目前课程为0
    ${dict}  create list
#    log to console  ${dict}
    run keyword if  ${dict}==${listCourse}  log to console  系统中没有课程，初始化成功
    ...  ELSE   log to console  初始化失败，请检查代码
    # 输入课程名称
    ${course}  get value from user  请输入课程名，输入 q 则退出程序
    run keyword if  'q'==$course  exit for loop
    ${msg}  get value from user  请输入课程描述，输入 q 则退出程序
    run keyword if  'q'==$course  exit for loop
    ${order}  get value from user  请输入课程展示次序，输入 q 则退出程序
    run keyword if  'q'==$course  exit for loop
    add  ${course}  ${msg}  ${order}
    ${listCourse}  lists   1  60
    run keyword if
    ...  "${course}"=="${listCourse[0]['name']}" and "${msg}"=="${listCourse[0]['desc']}" and "${order}"=="${listCourse[0]['display_idx']}"
    ...  log to console  课程增加成功，测试通过


