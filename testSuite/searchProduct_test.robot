*** Settings ***
Resource          ../resources.robot
Resource          ../pages/login_pages.robot
Resource          ../pages/home_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SKU_NUMBER}        SKU00717707
*** Test Cases ***
Search SKU
    [Template]    Open Search by SKU
    #SearchData
    ${SKU_NUMBER}

*** Keywords ***
Open Search by SKU
        [Arguments]          ${SKU_NUMBER}
        GIVEN Home Page To Login Email Page
        and Login Account Success
        and Home Page After Login
        WHEN Search Product by SKU    ${SKU_NUMBER}
        THEN Product by SKU Showed
