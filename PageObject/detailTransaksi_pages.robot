*** Settings ***
Library       SeleniumLibrary


*** Variables ***
${SUBMIT_BUTTON}                  id=btnSubmit
${OPTYNUMBER_LABLE}               //div[@class='col-lg-12 bt-page-title text-center']/h4/span[@class='bt-typo-mono']
${TAMBAHKANCATATAN_TEXTAREA}      name=notes-modal
${BUATORDER_BUTTON}               id=btnSubmitOrder
#Beli flow
${MESSAGE_SUCCES_BUAT_ORDER}      //div[@class='alert alert-success']
${MESSAGE_WAITING_APPROVED}       //div[@class='alert alert-info']
${TAMBAHKANCATATANNEGO_TEXTAREA}      name=nego-notes
${BELI_BUTTON_CF}                     name=beli
${POPUP_BELIORDER_BELI_BUTTON_CF}             //div[@class='modal-dialog modal-md']/div/div[@class='modal-footer']/input[@name='beli']
${STATUS_LABEL_CF}                            //div/div[@class='col-lg-4 col-md-6 bt-detail-overview __accordion']/ul/li[contains(text(),'Status :')]
# Approve flow
${SETUJU_BUTTON_APPROVER_CF}                 name=setuju
${TAMBAHKANCATATAN_TEXTAREA_APPROVE}         name=approval-notes
${POPUP_APPROVE_APPROVE_BUTTON_CF}            //div[@class='modal-dialog modal-md']/div/div[@class='modal-footer']/input[@name='approval']
${opty_number}
${SELECT_NPWP}                                //select[@name='npwpAccountId']

# Edit Opty
${EDITOPTY_ICON}                              //body[@id='bt-bisnis-brand']/div/div[3]/div[3]/div/div/div/a
# //div/div/a[@class='btn btn-default btn-edit-order']/span[@class='pt-icon-large pt-icon-edit']
${INPUT_EDITOPTY_TEXT}                        id=optyName
${UPDATEOPTY_BUTTON}                          //a[@class='btn btn-default btn-edit-order__tick']/span[@class='pt-icon-large pt-icon-tick']
${OPTYNAME_LABEL}                             id=optyNameSelected
${SUCCESSUPDATEOPTY_MESSAGE}                    //p[@class='message' and contains(text(),'Berhasil mengupdate')]
${KEMBALI_HYPERLINK}                            //a[@class='bt-back--link']
*** Keywords ***
Detail Transaksi Opened
    Wait Until Element Is Visible    ${OPTYNUMBER_LABLE}
    ${opty_number}      Get Text     ${OPTYNUMBER_LABLE}
    Set Global Variable    ${opty_number}    ${opty_number}
    ${href}=    Get Location
#    ${data}           geturlsplit           ${href}
#    Log To Console      Label = ${opty_number} and URL = ${data}
#    Should Be Equal     ${opty_number}     ${data}


Click Submit Button From Detail Transaksi
    Sleep    3
    Execute JavaScript    window.scrollTo(0,700)
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}
    Click Element                    ${SUBMIT_BUTTON}


Click Beli Button From CF
    Sleep    3
    Execute JavaScript    window.scrollTo(0,700)
    Wait Until Element Is Visible    ${BELI_BUTTON_CF}      timeout=30
    Click Element                    ${BELI_BUTTON_CF}

Click Setuju Button For Approver From CF
    Sleep    3
    Execute JavaScript    window.scrollTo(0,700)
    Wait Until Element Is Visible    ${SETUJU_BUTTON_APPROVER_CF}
    Click Element                    ${SETUJU_BUTTON_APPROVER_CF}

# Pop Up Submit Order

Input Tambahkan Catatan Field
    [Arguments]                             ${opty_number}
    Wait Until Element Is Visible         ${TAMBAHKANCATATAN_TEXTAREA}
    Input Text                            ${TAMBAHKANCATATAN_TEXTAREA}    ${opty_number}


Input Tambahkan Catatan Nego Field
    [Arguments]                             ${opty_number}
    Wait Until Element Is Visible         ${TAMBAHKANCATATANNEGO_TEXTAREA}
    Input Text                            ${TAMBAHKANCATATANNEGO_TEXTAREA}    ${textarea}

Input Tambahkan Catatan Approve Field
    [Arguments]                             ${textarea}
    Wait Until Element Is Visible         ${TAMBAHKANCATATAN_TEXTAREA_APPROVE}
    Input Text                            ${TAMBAHKANCATATAN_TEXTAREA_APPROVE}    ${textarea}


Click Beli Button From CF From Pop Up Order Buy
    Wait Until Element Is Visible         ${POPUP_BELIORDER_BELI_BUTTON_CF}
    Click Element                         ${POPUP_BELIORDER_BELI_BUTTON_CF}

Click Buat Order Button
    Wait Until Element Is Visible         ${BUATORDER_BUTTON}
    Click Element                         ${BUATORDER_BUTTON}


Click Beli Button From CF From Pop Up Approval Order
    Wait Until Element Is Visible         ${POPUP_APPROVE_APPROVE_BUTTON_CF}
    Click Element                         ${POPUP_APPROVE_APPROVE_BUTTON_CF}


Message Success Buat Order
    Wait Until Page Contains Element      ${MESSAGE_SUCCES_BUAT_ORDER}
    Wait Until Element Is Visible         ${MESSAGE_SUCCES_BUAT_ORDER}      timeout=15
    Sleep    2

Message Success Order Buy
    Sleep    2
    Wait Until Keyword Succeeds         60 seconds    0 min 0 sec 1 ms   Wait Until Element Is Visible     ${MESSAGE_WAITING_APPROVED}
    Sleep    2

Status Approval requestor
    Wait Until Element Is Visible         ${STATUS_LABEL_CF}

Select NPWP
    [Arguments]                     ${DataselectNPWP}
    Wait Until Element Is Visible         ${SELECT_NPWP}
    # Click Element       ${SELECT_NPWP}
    Select From List By Label         ${SELECT_NPWP}            ${DataselectNPWP}

Click Icon Edit Opty
    Wait Until Element Is Visible     ${EDITOPTY_ICON}          timeout=30
    Click Element                     ${EDITOPTY_ICON}

Input Edit Opty
    [Arguments]                      ${new_opty}
    Wait Until Element Is Visible     ${INPUT_EDITOPTY_TEXT}
    Input Text        ${INPUT_EDITOPTY_TEXT}                ${new_opty}

Click Check Button Update Opty
    Wait Until Element Is Visible     ${UPDATEOPTY_BUTTON}
    Click Element                     ${UPDATEOPTY_BUTTON}

Get opty name
    Wait Until Element Is Visible     ${SUCCESSUPDATEOPTY_MESSAGE}      timeout=20
    Sleep    2
    Wait Until Element Is Visible     ${OPTYNAME_LABEL}
    ${opty_name}        Get Text            ${OPTYNAME_LABEL}
    Set Global Variable    ${opty_name}    ${opty_name}


Update Opty From Page Detail Transaction
    [Arguments]             ${new_opty}
    Click Icon Edit Opty
    Input Edit Opty      ${new_opty}
    Click Check Button Update Opty
    Get opty name

Click Hyperlink Kembali
    Wait Until Element Is Visible     ${KEMBALI_HYPERLINK}
    Click Element       ${KEMBALI_HYPERLINK}
    Sleep    2
