*** Settings ***
# 导入其他路径下导模块
#Library  day1.testCourses.py
#Library  day1.testCourses
# 只导模块时，运行时要加 -P .
#Library  courseList
# 路径导入法
Library  courseList.py

*** Test Cases ***
#获取课程
    ${course}=  get course
    # @{course} 是解包,将list拆成单独的
    FOR  ${i}   IN   @{course}
    log to console  ${i}[name]
    END
    log many  @{course}
#
#
#列表类型
#    # 创建一个列表
    ${list}  create list  a   c  b
    log to console  ${list}[1]


#字典类型
    # 创建一个字典
    ${dict}  create dictionary   a=1   b=12  c=23
    log many  ${dict}
    log many  @{dict}
    log to console  ${dict}[a]


#循环1
   FOR  ${i}   IN RANGE  10
   log to console  ${i}
   END


#循环2
   FOR  ${q}  IN RANGE  1  11
   log to console  ${q}
   END


#循环3
   FOR  ${e}   IN RANGE  0  11  2
   log to console  ${e}
   END