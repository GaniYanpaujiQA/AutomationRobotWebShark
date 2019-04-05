*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Library     OperatingSystem

*** Variables ***
${BROWSER}  chrome
${TYPE OF FILE}  png
${PATHSCREENSHOT}           ../screenshot/
${ENV}                      DEVELOPMENT
#DEVELOPMENT
#STAGING
${HIDE_BROWSER}             HIDE
#HIDE
#SHOW
*** Keywords ***
Open Main Page Using Chrome Browser
    Run Keyword If       '${ENV}' == 'DEVELOPMENT'
    ...     Data Element Development
    ...     ELSE
    ...     Data Element STAGING
    Run Keyword If       '${HIDE_BROWSER}' == 'HIDE'
    ...     Hide Main Page
    ...     ELSE
    ...     Open Browser    ${MAIN_PAGE}   Chrome





Open Main Page CMS Using Chrome Browser
    Run Keyword If       '${ENV}' == 'DEVELOPMENT'
    ...     Data Element Development
    ...     ELSE
    ...     Data Element STAGING
    Run Keyword If       '${HIDE_BROWSER}' == 'HIDE'
    ...     Hide CMS Page
    ...     ELSE
    ...     Open Browser    ${MAIN_PAGE_CMS}     chrome


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

Data Element Development
   Log To Console                       Env = Development
   Set Global Variable                  ${MAIN_PAGE}                        http://shark-cf-development.bhinnekalocal.com
   Set Global Variable                  ${MAIN_PAGE_CMS}                    http://development.shark.bhinneka.com
   Set Global Variable                  ${URL_API}                          http://dev.bhinnekalocal.com/shark-backend/
   Set Global Variable                  ${TAB_PESANANBERJALAN}              //a[@href='http://shark-cf-development.bhinnekalocal.com/account/transaction/assistedOrder']
   Set Global Variable                  ${TAB_SEMUAPESANAN}                 //a[@href='http://shark-cf-development.bhinnekalocal.com/account/transaction']

Data Element STAGING
   Log To Console                       Env = Staging
   Set Global Variable                  ${MAIN_PAGE}                        http://shark-cf-staging.bhinnekalocal.com/
   Set Global Variable                  ${MAIN_PAGE_CMS}                    http://staging.shark.bhinneka.com/
   Set Global Variable                  ${URL_API}                          http://staging.bhinnekalocal.com/shark-backend/
   Set Global Variable                  ${TAB_PESANANBERJALAN}              //a[@href='http://shark-cf-staging.bhinnekalocal.com/account/transaction/assistedOrder']
   Set Global Variable                  ${TAB_SEMUAPESANAN}                 //a[@href='http://shark-cf-staging.bhinnekalocal.com/account/transaction']



Hide Main Page
   Log To Console                       Hide Browser
   ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
   Call Method      ${chromeOptions}    add_argument    headless
   Call Method      ${chromeOptions}    add_argument    window-size\=1366,768
   Call Method      ${chromeOptions}    add_argument    disable-gpu
   ${options}=      Call Method     ${chromeOptions}    to_capabilities
   Open Browser     ${MAIN_PAGE}   browser=chrome       desired_capabilities=${options}
#   Maximize Browser Window

Hide CMS Page
   Log To Console                       Hide Browser
   ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
   Call Method      ${chromeOptions}    add_argument    headless
   Call Method      ${chromeOptions}    add_argument    window-size\=1366,768
   Call Method      ${chromeOptions}    add_argument    disable-gpu
   ${options}=     Call Method        ${chromeOptions}    to_capabilities
   Open Browser     ${MAIN_PAGE_CMS}       browser=chrome       desired_capabilities=${options}
#    Maximize Browser Window