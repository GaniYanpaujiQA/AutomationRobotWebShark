*** Settings ***
Resource          ../../resources.robot
Resource          ../../PageObject/apiCollection/loginApi_collection.robot
#Test Setup        Create Session URL Rest API

#*** Variables ***
#${EMAIL}                        a.admin@grr.la
#${PASSWORD}                     Bhinneka321
#*** Test Cases ***
#Login API CMS
#      [Template]   Get Token From Login CMS
##       Email                            Password
#       ${EMAIL}                        ${PASSWORD}


*** Keywords ***
Get Token From Login CMS
        [Arguments]                     ${EMAIL}                        ${PASSWORD}
        GIVEN Create Session URL Rest API
        And Set Location JSON                 ${EMAIL}                        ${PASSWORD}
        And Add Headers
        WHEN Send Post Request
        THEN Get Token

