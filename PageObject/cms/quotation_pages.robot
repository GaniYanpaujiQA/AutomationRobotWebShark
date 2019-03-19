*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${SENDQUOTATION_BUTTON}          //button[@type='button' and contains(text(),'Send Quotation')]
${POPUP_SENDQUOTATION_BUTTON}          //button[@type='button' and @class='btn btn-success' and contains(text(),'Send Quotation')]
${STATUS_LABEL}                  //div[@class='col-sm-4']/address/div
${POPUP_NOTES_TEXTAREA}          name=noteQuotation
${SUCCESS_MESSAGE}               //div[@class='toast-message']
${GENERATESO_BUTTON}            //div/div/div[@class='col-sm-8 col-xs-7']/button[contains(text(),'Generate SO')]
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

Send Quation Success Message
      Sleep    2
      Wait Until Element Is Visible     ${SUCCESS_MESSAGE}          timeout=30
