*** Settings ***
Library     SeleniumLibrary
Resource          ../../resources.robot
Resource          ../../PageObject/cms/loginCMS_pages.robot
Resource          ../../PageObject/cms/homeCMS_pages.robot
Test Setup        Open Main Page CMS Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
${CATATANTRANSAKSI}   SADASDASasda
*** Test Cases ***
Detail Product Search by SKU
    Open Detail Product by SKU
    [Teardown]    Close Browser

*** Keywords ***
Open Detail Product by SKU
        GIVEN Open Dashboard
        WHEN Input Email Textbox Click Next Button
        and Input Password Textbox Click Signing Button
        and Confirmation Button No
        THEN Home Pages CMS Opened
