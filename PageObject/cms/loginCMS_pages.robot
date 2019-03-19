*** Settings ***
Library       SeleniumLibrary
Resource     ../../resources.robot

*** Variables ***
${LOGIN_BUTTON_CMS}                 //button[@type='submit' and @class='btn btn-lg btn-primary btn-block']
${EMAIL_TEXTBOX}                    id=i0116
${NEXTEMAIL_BUTTON}                 id=idSIButton9
${PASSWORD_TEXTBOX}                 id=i0118
${SIGNIN_BUTTON}                    id=idSIButton9
${CONFIRMATIONLOGIN_BUTTON_NO}      id=idBtn_Back

*** Keywords ***
Open Dashboard
    Wait Until Page Contains Element     ${LOGIN_BUTTON_CMS}        timeout=15
    Wait Until Element Is Visible     ${LOGIN_BUTTON_CMS}
    Click Element                     ${LOGIN_BUTTON_CMS}

Input Email Textbox Click Next Button
#     Need log
     Wait Until Element Is Visible     ${EMAIL_TEXTBOX}
     Wait Until Element Is Visible     ${NEXTEMAIL_BUTTON}
     Input Text       ${EMAIL_TEXTBOX}           autoqa@bhinneka.com
     Click Element        ${NEXTEMAIL_BUTTON}


Input Password Textbox Click Signing Button
#     Need log
     Wait Until Element Is Visible     ${PASSWORD_TEXTBOX}
     Wait Until Element Is Visible     ${SIGNIN_BUTTON}
     Input Text       ${PASSWORD_TEXTBOX}            Bhinneka10610
     Click Element        ${SIGNIN_BUTTON}

Confirmation Button No
     Wait Until Element Is Visible     ${CONFIRMATIONLOGIN_BUTTON_NO}
     Click Element        ${CONFIRMATIONLOGIN_BUTTON_NO}

Login Account CMS Success
     Open Dashboard
     Input Email Textbox Click Next Button
     Input Password Textbox Click Signing Button
     Confirmation Button No
