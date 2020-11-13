*** Variables ***
#  全局变量
${libPath}  http://127.0.0.1/mgr/login/login.html
@{user1}  用户名  密码   #  调用的时候取用户名是 ${user1}[0]  取用户密码是 ${user1}[1]
@{user2}  name=用户名  pwd=密码   #  调用的时候取用户名是 ${user2}[name]  取用户密码是 ${user2}[pwd]


*** Keywords ***
login
    open browser  ${libPath}   chrome
    set selenium implicit wait  10
    # 这里没有输入账号密码的操作是因为浏览器缓存了账号密码
    click element  css=.btn-success


addCourse
    # [Arguments]  是用来声明变量的
    [Arguments]  ${name}   ${desc}   ${display_idx}
    click element  css=.btn-md
    input text  css=[ng-model="addData.name"]  ${name}
    input text  css=[ng-model="addData.desc"]  ${desc}
    input text  css=[ng-model="addData.display_idx"]   ${display_idx}
    click element  css=[ng-click="addOne()"]


checkCourse
    [Arguments]  ${enterCourse}
#    这里只可以获取一个元素
    ${courseName}  get text  xpath=//td[2]/span
    log to console  ${courseName}
    should be true  $enterCourse in $courseName

checkCourses
    [Arguments]   @{newCourse}    #类似于python里面的*args，用于传不定数量的参数
    #  这里能选取所有元素
    ${courseName}  get webelements  css=table td:nth-child(2)
    ${text}  evaluate  [ele.text for ele in $courseName]
    # sorted  python 排序方法，默认为升序要进行反向排序，也通过传入第三个参数 reverse=True
    ${t}  evaluate  [i for i in sorted($text)]
    ${c}  evaluate  [i for i in sorted($newCourse)]
    run keyword if  $t==$c
    ...  log to console  课程增加成功
    ...  ELSE  log to console  判断有问题

deleteAllCourse
    set selenium implicit wait  2
    FOR  ${i}  IN RANGE  9999
        ${elems}  get webelements  css=[ng-click="delOne(one)"]
        exit for loop if  $elems==[]
        click element  ${elems}[0]
        click element  css=.btn-primary
        sleep  1
    END
    close browser

checkCourse1  # 用来每个用例只添加一次课程，时使用
    [Arguments]  ${newCourse}
    ${lists}  create list  ${newCourse}
    #  这里能选取所有元素
    ${courseName}  get webelements  css=table td:nth-child(2)
    ${text}  evaluate  [ele.text for ele in $courseName]
    should be true  $lists[0] in $text
    log to console  课程增加成功