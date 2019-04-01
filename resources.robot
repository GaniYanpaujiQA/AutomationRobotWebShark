*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
#Library     Selenium2Library
Library     OperatingSystem

*** Variables ***
${MAIN_PAGE}                http://shark-cf-development.bhinnekalocal.com
#http://shark-cf-development.bhinnekalocal.com
#http://shark-cf-staging.bhinnekalocal.com/
#

${MAIN_PAGE_CMS}            http://development.shark.bhinneka.com
#http://development.shark.bhinneka.com
#http://staging.shark.bhinneka.com/

${URL_API}              http://dev.bhinnekalocal.com/shark-backend/
#http://staging.bhinnekalocal.com/shark-backend/
${BROWSER}  chrome
${TYPE OF FILE}  png
${PATHSCREENSHOT}           ../screenshot/
*** Keywords ***
Open Main Page Using Chrome Browser
#      Open Browser    ${MAIN_PAGE}     chrome
   ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
   Call Method    ${chromeOptions}    add_argument    headless
   Call Method    ${chromeOptions}    add_argument    window-size\=1366,768
#   Call Method    ${chromeOptions}    add_argument    disable-gpu
   ${options}=     Call Method     ${chromeOptions}    to_capabilities
   Open Browser    ${MAIN_PAGE}   browser=chrome       desired_capabilities=${options}
#   Maximize Browser Window
#    Get Date Path
#    Set Screenshot Directory       ${Path}
#    Screenshot
     # Open Browser    ${MAIN_PAGE}   Chrome



Open Main Page CMS Using Chrome Browser
    ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chromeOptions}    add_argument    headless
    Call Method    ${chromeOptions}    add_argument    window-size\=1366,768
#    Call Method    ${chromeOptions}    add_argument    disable-gpu
    ${options}=     Call Method        ${chromeOptions}    to_capabilities
    Open Browser    ${MAIN_PAGE_CMS}       browser=chrome       desired_capabilities=${options}
#    Maximize Browser Window
#    Get Date Path
#    Set Screenshot Directory       ${Path}
#    Screenshot
#     Open Browser    ${MAIN_PAGE_CMS}     chrome
#     Open Login Page Using Chrome Browser
#   Open Browser    ${LOGIN_PAGE}   Chrome


Create Session URL Rest API
    Create Session  Shark   ${URL_API}
#    &{headers}=  Create Dictionary  Content-Type=application/json
#    ${json_object}=     Load Json From File     testjson.json
#    ${resp} =   Post Request     Shark    auth/login   data=${json_object}   headers=${headers}

Get DateTime
  ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
  [Return]     ${date1}

Get Date Path
    ${Date}=  Get DateTime
    Set Global Variable  ${Path}  ${PATHSCREENSHOT} ${Date}
    [Return]     ${Date}


Screenshot
  ${Date}=  Get Date Path
  Capture Page Screenshot
  # Wait Until Page Contains
  # ${datetime}=  Get DateTime
  # Picture-${Date}.${TYPE OF FILE}
