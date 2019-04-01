*** Settings ***
Resource          ../../resources.robot
Resource          ../../PageObject/apiCollection/getQuotationDetail_collection.robot
#Resource          ../../PageObject/apiCollection/loginApi_collection.robot
#Resource          ../../PageObject/apiCollection/quotationHistoryApi_collection.robot
#Resource          loginAPICMS.robot
#Test Setup        Create Session URL Rest API

*** Variables ***



#*** Test Cases ***
#Opty Num
#    Get Opty Num From Backend
#*** Keywords ***
#Get Opty Num From Backend
##        [Arguments]          ${EMAIL}                        ${PASSWORD}
#        GIVEN Create Session URL Rest API
##        And Get Token From Login CMS             ${EMAIL}                        ${PASSWORD}
#        And Set Location JSON QuoatationHistoryAPI
#        And Add Headers QuoatationHistoryAPI
#        WHEN Send Post Request QuoatationHistoryAPI
#        THEN Get Opty

