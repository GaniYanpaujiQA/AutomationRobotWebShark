*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${LOGIN_BUTTON}                   //a[contains(text(),'Login')]
${HEADERS_LOGINUSER}              //div[@class='navbar-cart dropdown bt-navbar__cart']

*** Keywords ***
Home Page Already Opened
    Wait Until Element Is Visible    ${LOGIN_BUTTON}

Klik Login Button
    Click Element                    ${LOGIN_BUTTON}

Home Page After Login
    Wait Until Element Is Visible    ${HEADERS_LOGINUSER}


Home Page To Login Email Page
    Home Page Already Opened
    Klik Login Button
