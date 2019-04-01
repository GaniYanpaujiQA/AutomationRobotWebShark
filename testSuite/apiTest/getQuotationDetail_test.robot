*** Settings ***
Resource          ../../resources.robot
Resource          ../../PageObject/apiCollection/getQuotationDetail_collection.robot

*** Variables ***

#
#
#*** Test Cases ***
#Opty Num
#    Get Opty Num From Backend
*** Keywords ***
Get Opty Num From Backend
        GIVEN Create Session URL Rest API
        And Set Location JSON QuoatationHistoryAPI
        And Add Headers QuoatationHistoryAPI
        WHEN Send Post Request QuoatationHistoryAPI
        THEN Get Opty

