*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${INPUT_PASSWORD}           //input[@name='password']
${BUTTON_MASUK}             //div[5]/button

*** Keywords ***
Login Password Page Will Be Success
   Wait Until Element Is Visible    ${INPUT_PASSWORD}
   Wait Until Element Is Visible    ${BUTTON_MASUK}

Input Password Field
   [Arguments]              ${password}
   Input Text        ${INPUT_PASSWORD}      ${password}
   Click Element     ${BUTTON_MASUK}

Login Password
    Login Password Page Will Be Success
    Input Password Field      Bhinneka321
