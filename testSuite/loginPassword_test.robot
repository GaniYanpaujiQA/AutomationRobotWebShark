*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${PASSWORD}                Bhinneka321

*** Test Cases ***
Open Login Password Pages
        [Template]        Open Password Page
        #user_name
        ${password}

*** Keywords ***
Open Password Page
        [Arguments]             ${password}
        GIVEN Login Password Page Already Opened
        WHEN Input Password And Click Masuk Button         ${password}
        THEN Login Home Page Will Be Success


Login Password Page Already Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page

Input Password And Click Masuk Button
        [Arguments]                                 ${password}
        Login Password Opened
        Input Password Field       ${password}


Login Home Page Will Be Success
        Home Page After Login
