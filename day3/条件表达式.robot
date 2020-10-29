*** Settings ***
Library  test2
*** Test Cases ***
case1
    # evaluate  中可以使用python语法，但是不建议全使用
    ${q}   evaluate  [i for i in range(100)]
    log to console  ${q}
    ${d}   drivers
    evaluate  $d.get('http://www.baidu.com')