*** Settings ***
Resource          ../resources.robot
Resource          ../pages/loginEmail_pages.robot
Resource          ../pages/loginPassword_pages.robot
Resource          ../pages/home_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${USER_NAME}                a@grr.la

*** Test Cases ***
Open Login Email Pages
        [Template]        Open Login Email Page
        #user_name
        ${USER_NAME}

*** Keywords ***
Open Login Email Page
        [Arguments]             ${user_name}
        GIVEN Login Email Page already Opened
        WHEN Input Email And Click Next Button         ${user_name}
        THEN Login Password Page Will Be Success


Login Email Page already Opened
        Home Page To Login Email Page

Input Email And Click Next Button
        [Arguments]                      ${user_name}
        Login Email Page Opened
        Input Email                      ${user_name}


Login Password Page Will Be Success
        Login Password Opened
