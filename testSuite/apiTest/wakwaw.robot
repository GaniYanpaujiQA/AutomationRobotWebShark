*** Settings ***
#Resource    loginAPICMS.robot
Library    JSONLibrary
Library      OperatingSystem
Library            HttpLibrary.HTTP
*** Variables ***
${SUBSCRIBER_A}        3320724191
${CATATANTRANSAKSI}   SADASDASasda
*** Test Cases ***
Detail Product Search by SKU
    Rubah Token          ${SUBSCRIBER_A}
#    [Teardown]    Close Browser

*** Keywords ***
Rubah Token
     [Arguments]    ${SUBSCRIBER_A}
#    ${json}=    Get file    testjson.json
##    ${object}=   Evaluate    json.loads(${json})    json
#    log      Hello, my name is ${json['email']} ${json['password']}
#    Parse Json From File
    ${file} =                             Get File       testjson.json
    ${json} =                             Parse Json         ${file}
#    log to console                                ${json['email']} ${json['password']}
    ${json_object}=   Update Value To Json  ${json}         $..email      brewek
    ${json_object}=   Update Value To Json  ${json}         $..password      Warjok
    ${json_string}=  Convert JSON to String  ${json_object}
#    Set Suite Variable  ${json_string}
    log to console                                ini sudah diupdate emilnya = ${json['email']} : Password = ${json['password']}

#    Log                                   Get Json Value    ${json}    /password
#    Log                                   Get Json Value    ${json}    /messages
#  [Return]                              ${json}

#${text.replace("\n", " ")}