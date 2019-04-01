*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         RequestsLibrary
Library         JSONLibrary
Library         OperatingSystem
Library         RequestsLibrary
Library         HttpLibrary.HTTP
*** Variables ***
# ${json_object}              asdas
# ${headers}                  sadsad
# ${resp}                     asdsad
# ${body}                     madsasd

*** Keywords ***

Set Location JSON QuoatationHistoryAPI
    ${json_object}=     Load Json From File    /Users/ganiyanpauji/Documents/SharkWEB\ Kebutuhan\ Test/testSuite/apiTest/testjson.json
    Set Global Variable     ${json_object}      ${json_object}


Add Headers QuoatationHistoryAPI
    ${headers}=  Create Dictionary  Content-Type=application/json   Authorization=${token}
    Set Global Variable     ${headers}      ${headers}


Send Post Request QuoatationHistoryAPI
    ${resp} =   Get Request   Shark   quotation-history?quotationId=${quotation_number}   headers=${headers}
    Set Global Variable    ${resp}       ${resp}

Get Opty
    ${body}=  Set Variable  ${resp.json()}
    ${data}=  Get From Dictionary   ${body}         data
    ${list}=    Get From List       ${data}     0
    ${opty}=    Get From Dictionary  ${list}    optyId
    ${item1}=     set variable  ${opty}
    Set Global Variable    ${opty_number}       ${item1}
    log to console      ${opty_number}



