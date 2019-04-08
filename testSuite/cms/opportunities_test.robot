*** Settings ***
Library     SeleniumLibrary
Resource          ../../resources.robot
Resource          ../../PageObject/cms/loginCMS_pages.robot
Resource          ../../PageObject/cms/homeCMS_pages.robot
Resource          ../../PageObject/cms/opportunities_pages.robot
Resource          ../../PageObject/cms/quotation_pages.robot
# Test Setup

*** Variables ***
${SKU_NUMBER}        SKU00717707
${CATATANTRANSAKSI}   SADASDASasda
*** Test Cases ***
Open Opportunities
    Open Opportunities Pages
    [Teardown]    Close Browser

*** Keywords ***
Open Opportunities Pages
        GIVEN Open Main Page CMS Using Chrome Browser
        And Login Account CMS Success
        And Home Pages CMS Opened
        And Click Menu Opportunities
        WHEN Opportunities Page Opened
        And Select All Email From Dropdown
        And Search Data From Opportunities
        And Open Search Data From Opportunities Already Showed
        And Open Tab Quotations
        And Click Data From List Quotations
        THEN Open Quotation
