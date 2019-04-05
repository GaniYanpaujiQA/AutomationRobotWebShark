*** Settings ***
Library       SeleniumLibrary
Library       ../src/GetDataSplit.py
*** Variables ***
${SENDQUOTATION_BUTTON}          //button[@type='button' and contains(text(),'Send Quotation')]
${POPUP_SENDQUOTATION_BUTTON}          //button[@type='button' and @class='btn btn-success' and contains(text(),'Send Quotation')]
${STATUS_LABEL}                  //div/div[1]/address/div[2]
${POPUP_NOTES_TEXTAREA}          name=noteQuotation
${SUCCESS_MESSAGE}               //div[@class='toast-message']
${GENERATESO_BUTTON}             //div/div/div[@class='col-sm-8 col-xs-7']/button[contains(text(),'Generate SO')]
${QUOTATION_NUMBER_LABEL}        //h1[contains(text(),'Quotation Number')]
${APPROVE_BUTTON_QUOTATION}      //button[@class='btn btn-success' and contains(text(),'Approve Quotation')]
${QUOTATIONID_TEXTBOX}             name=quotationId
${APPROVEQUOTATION_BUTTON_POPUP}      //button[@class='btn btn-primary' and contains(text(),'Approve Quotation')]

# ${POPUP_SENDQUOTATION_BUTTON}          name='noteQuotation'
# //div[@class='modal-lg modal-dialog']/div[@class='modal-footer']/button[@type='button' and @class='btn btn-success' and contains(text(),'Send Quotation')]
*** Keywords ***
Open Quotation
      # Wait Until Element Is Visible     ${SENDQUOTATION_BUTTON}
    Wait Until Element Is Visible     ${STATUS_LABEL}

Click Button Send Quatation
    Wait Until Element Is Visible     ${SENDQUOTATION_BUTTON}
    Click Element                     ${SENDQUOTATION_BUTTON}

Click Generate SO Button
    Sleep    2
    Wait Until Element Is Visible     ${GENERATESO_BUTTON}        timeout=30
    Click Button                      ${GENERATESO_BUTTON}

Pop Up Send Quatation Input Notes
    [Arguments]           ${textarea}
    Wait Until Element Is Visible     ${POPUP_NOTES_TEXTAREA}
    Input Text          ${POPUP_NOTES_TEXTAREA}      ${textarea}

Pop Up Send Quatation Click Button Send Quatation
    Wait Until Element Is Visible     ${POPUP_SENDQUOTATION_BUTTON}
    Click Button                      ${POPUP_SENDQUOTATION_BUTTON}
    Sleep    2

Send Quation Success Message
    Sleep    2
    Log To Console     Success Message Not Stable
    Wait Until Keyword Succeeds         60 seconds    0 min 0 sec 1 ms   Wait Until Element Is Visible     ${STATUS_LABEL}          timeout=30
#    Wait Until Element Is Visible     ${STATUS_LABEL}          timeout=30
    ${status}    Get Text    ${STATUS_LABEL}
    Log To Console     ${status}
#    Wait Until Element Is Visible     ${SUCCESS_MESSAGE}          timeout=30

Status Transaction From CMS
    Sleep    2
    Log To Console     Success Message Not Stable
#    Wait Until Element Is Visible     ${SUCCESS_MESSAGE}          timeout=30

Quotation Get Number
    Sleep    3
    Wait Until Keyword Succeeds         60 seconds    0 min 0 sec 1 ms   Wait Until Element Is Visible     ${QUOTATION_NUMBER_LABEL}          timeout=30
    ${quotation_number}    Get Text    ${QUOTATION_NUMBER_LABEL}
    ${quotation_number}=    splitData               ${quotation_number}
    Set Global Variable     ${quotation_number}      ${quotation_number}
    Log To Console     iniasdasdsadasdasdas=====${quotation_number}

Click Approve Button CMS Quotation
    Sleep    4
    Wait Until Element Is Visible     ${APPROVE_BUTTON_QUOTATION}          timeout=30
    Click Button                      ${APPROVE_BUTTON_QUOTATION}

Input Quotation ID from POP UP Approve Quotation
    Wait Until Element Is Visible     ${QUOTATIONID_TEXTBOX}
    Input Text          ${QUOTATIONID_TEXTBOX}       ${quotation_number}

Click Approve Button CMS Quotation from POP UP Approve Quotation
    Sleep    2
    Wait Until Element Is Visible     ${APPROVEQUOTATION_BUTTON_POPUP}          timeout=30
    Click Button                      ${APPROVEQUOTATION_BUTTON_POPUP}
