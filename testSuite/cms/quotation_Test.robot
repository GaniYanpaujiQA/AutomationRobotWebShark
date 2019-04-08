*** Settings ***
Library     SeleniumLibrary
Resource          ../../resources.robot
Resource          ../../PageObject/cms/loginCMS_pages.robot
Resource          ../../PageObject/cms/homeCMS_pages.robot
Resource          ../../PageObject/cms/opportunities_pages.robot
Resource          ../../PageObject/cms/quotation_pages.robot
Test Setup        Open Main Page CMS Using Chrome Browser

*** Variables ***
${SKU_NUMBER}        SKU00717707
${CATATANTRANSAKSI}   SADASDASasda
*** Test Cases ***
Open Opportunities
    Open Opportunities Pages
    [Teardown]    Close Browser

*** Keywords ***
Open Opportunities Pages
        GIVEN Login Account CMS Success
        And Click Menu Opportunities
        And Open Quotation Pages From Opportunities    opty_number    selectAll
        And Open Quotation
        WHEN Click Button Send Quatation
        And Pop Up Send Quatation Input Notes
        And Pop Up Send Quatation Click Button Send Quatation
        THEN Send Quation SUccess Message
