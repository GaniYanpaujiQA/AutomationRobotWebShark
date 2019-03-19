*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${INPUT_EMAIL}            //input[@name='email']
${BUTTON_LANJUT}          //button
${INPUT_PASSWORD}           //input[@name='password']
${BUTTON_MASUK}             //div[5]/button

*** Keywords ***
Login Email Page Opened
  Wait Until Element Is Visible    ${INPUT_EMAIL}
  Wait Until Element Is Visible    ${BUTTON_LANJUT}

Input Email
    [Arguments]      ${user_name}
    Input Text       ${INPUT_EMAIL}         ${user_name}
    Click Element    ${BUTTON_LANJUT}

Login Password Page Will Be Success
    Wait Until Element Is Visible    ${INPUT_PASSWORD}
    Wait Until Element Is Visible    ${BUTTON_MASUK}

Input Password Field
    [Arguments]              ${password}
    # Element Should Be Disabled        ${INPUT_EMAIL}
    Input Text        ${INPUT_PASSWORD}      ${password}
    Click Element     ${BUTTON_MASUK}



Login Account Success
    Login Email Page Opened
    Input Email    a.parentchildrequestor@grr.la
    Login Password Page Will Be Success
    Input Password Field      Bhinneka321

Login Account Requestor Success
    [Arguments]           ${email_requestor}    ${password}
    Login Email Page Opened
    Input Email    ${email_requestor}
    Login Password Page Will Be Success
    Input Password Field      ${password}
