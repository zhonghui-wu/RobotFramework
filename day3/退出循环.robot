*** Settings ***
Library  test2
Library  Dialogs      #  RF库，用于用户交互，如此输入框
*** Test Cases ***
#循环终止
#    FOR  ${i}   IN RANGE  9999
#        #  Get Value From User 等于 input
#        ${course}  Get Value From User  输入分数
#        # exit for loop 是结束循环
#        run keyword if  'q'==$course  exit for loop
#        #  courses 是调用 test2 中的函数
#        courses   ${course}
#    END



循环中止
     FOR  ${i}   IN RANGE  9999
        #  Get Value From User 等于 input
        ${course}  Get Value From User  输入分数
        # continue for loop 退出当次循环
        run keyword if  'w'==$course  continue for loop
        run keyword if  'q'==$course  exit for loop
        #  courses 是调用 test2 中的函数
        courses   ${course}
    END