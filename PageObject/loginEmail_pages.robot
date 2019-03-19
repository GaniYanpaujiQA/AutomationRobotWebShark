*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${INPUT_EMAIL}            //input[@name='email']
${BUTTON_LANJUT}          //button

*** Keywords ***
Login Email Page Opened
  Wait Until Element Is Visible    ${INPUT_EMAIL}
  Wait Until Element Is Visible    ${BUTTON_LANJUT}

Input Email
    [Arguments]      ${user_name}
    Input Text       ${INPUT_EMAIL}         ${user_name}
    Click Element    ${BUTTON_LANJUT}


Login Email Page To Login Password Page
    Login Email Page Opened
    Input Email    a@grr.la
