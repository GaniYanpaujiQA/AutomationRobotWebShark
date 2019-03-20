*** Settings ***
Resource          ../resources.robot
Resource          ../pages/login_pages.robot
Resource          ../pages/home_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
*** Test Cases ***
Search SKU
    [Template]    Open Search by SKU
    #SearchData
    ${SEARCHDATA}

*** Keywords ***
Open Search by SKU
        [Arguments]          ${SEARCHDATA}
        GIVEN Home Page To Login Email Page
        and Login Account Success
        and Home Page After Login
        WHEN Search Product by SKU    ${SEARCHDATA}
        THEN Product by SKU Showed
