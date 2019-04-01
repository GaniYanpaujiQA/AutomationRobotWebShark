*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
#Library     Selenium2Library
Library     OperatingSystem
Library     HttpLibrary.HTTP
*** Variables ***
# ${json_object}              asdas
# ${headers}                  sadsad
# ${resp}                     asdsad
# ${body}                     madsasd

*** Keywords ***

Set Location JSON
    [Arguments]         ${email}                        ${password}
    ${file} =                             Get File           /Users/ganiyanpauji/Documents/SharkWEB\ Kebutuhan\ Test/testSuite/apiTest/testjson.json
    ${json} =                             Parse Json         ${file}
    ${json_object}=   Update Value To Json      ${json}         $..email         ${email}
    ${json_object}=   Update Value To Json      ${json}         $..password      ${password}
#    ${json_string}=   Convert JSON to String     ${json_object}
#    Set Suite Variable  ${json_string}
    Set Global Variable     ${json}      ${json}


Add Headers
    ${headers}=  Create Dictionary  Content-Type=application/json
    Set Global Variable     ${headers}      ${headers}


Send Post Request
    ${resp} =   Post Request     Shark    auth/login   data=${json}   headers=${headers}
    Set Global Variable    ${resp}       ${resp} 

Get Token
    log to console                              sdakdsadasaskjdas =========${json['email']} ${json['password']}
    ${body}=  Set Variable  ${resp.json()}
    ${code}=  Get From Dictionary  ${body}  code
    ${msg} =   Get From Dictionary  ${resp.json()}  message
    ${item1}=  Get From Dictionary  ${body}         data
    ${token}=  Get From Dictionary  ${item1}        token
    Set Global Variable     ${token}      ${token}

