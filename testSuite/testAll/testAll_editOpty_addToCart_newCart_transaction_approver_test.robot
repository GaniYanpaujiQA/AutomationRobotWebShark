*** Settings ***
Resource          ../../resources.robot
Resource          ../../PageObject/login_pages.robot
Resource          ../../PageObject/menu_pages.robot
Resource          ../../PageObject/home_pages.robot
Resource          ../../PageObject/detail_product_pages.robot
Resource          ../../PageObject/detailTransaksi_pages.robot
Resource          ../../PageObject/daftarTransaksi_semuaPesanan_pages.robot
Resource          ../../PageObject/cms/loginCMS_pages.robot
Resource          ../../PageObject/cms/homeCMS_pages.robot
Resource          ../../PageObject/cms/opportunities_pages.robot
Resource          ../../PageObject/cms/quotation_pages.robot
# Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
${CATATANTRANSAKSI}   SADASDASasda
${EMAIL_REQUESTOR}    a.parentchildrequestor@grr.la
#a.approver@grr.la
${EMAIL_APPROVER}     a.parentchildapprover@grr.la
${PASSWORD}           Bhinneka321
${UNIT_BISNIS}        childapprover
# UB1
${SELECTALL}          Select All
${TEXTAREA}           SADSAsadsaad asda asdsad
${OPTYNAME}            asdsss
*** Test Cases ***
Create Transaction Approver Test
    [Template]    Create Transaction Approver
    #SearchData           catatan trx                  email requestor                 password          unitBisnis              Opty name               Select drop list       textarea         email Approver
    ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}               ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     ${EMAIL_APPROVER}
    ${SEARCHDATA}        ${CATATANTRANSAKSI}          a.parentrequestor@grr.la         ${PASSWORD}       parentapprover          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     a.parentapprover@grr.la
    ${SEARCHDATA}        ${CATATANTRANSAKSI}          a.requestor@grr.la               ${PASSWORD}       UB1                     ${OPTYNAME}             ${SELECTALL}              ${TEXTAREA}     a.approver@grr.la

#   ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}               ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     ${EMAIL_APPROVER}
#    ${SEARCHDATA}        ${CATATANTRANSAKSI}          a.parentrequestor@grr.la         ${PASSWORD}       PARENTAPPROVER          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     a.parentapprover@grr.la
#    ${SEARCHDATA}        ${CATATANTRANSAKSI}          a.requestor@grr.la               ${PASSWORD}       UB1                     ${OPTYNAME}             ${SELECTALL}              ${TEXTAREA}     a.approver@grr.la
#

*** Keywords ***
Create Transaction Approver
    [Arguments]          ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}               ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     ${EMAIL_APPROVER}
    GIVEN Create Transaction Get Opty       ${SEARCHDATA}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}
    And Send Quotation From CMS      ${SELECTALL}         ${TEXTAREA}
    And Buy Product From CF          ${EMAIL_REQUESTOR}      ${PASSWORD}            ${TEXTAREA}
    WHEN Approve By Approver CF      ${EMAIL_APPROVER}      ${PASSWORD}            ${TEXTAREA}
    THEN Generate SO From CMS        ${SELECTALL}

Create Transaction Get Opty
    [Arguments]          ${SEARCHDATA}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}
    Open Main Page Using Chrome Browser
    Home Page To Login Email Page
    Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
    Open Detail Page After Search SKU           ${SEARCHDATA}
    Add To Cart Product
    List Transaction Opened    ${UNIT_BISNIS}
    List First Transaction Selected
    Detail Transaksi Opened
    Update Opty From Page Detail Transaction    ${OPTYNAME}
    Click Submit Button From Detail Transaksi
    Input Tambahkan Catatan Field     ${opty_number}
    Click Buat Order Button
    Message Success Buat Order
    Close Browser




Send Quotation From CMS
       [Arguments]             ${SELECTALL}         ${TEXTAREA}
       Open Main Page CMS Using Chrome Browser
       Login Account CMS Success
       Home Pages CMS Opened
       Click Menu Opportunities
       Open Quotation Pages From Opportunities   ${opty_number}               ${SELECTALL}
       Open Quotation
       Click Button Send Quatation
       Pop Up Send Quatation Input Notes     ${TEXTAREA}
       Pop Up Send Quatation Click Button Send Quatation
       Send Quation Success Message
       Close Browser



Buy Product From CF
      [Arguments]               ${EMAIL_REQUESTOR}      ${PASSWORD}            ${TEXTAREA}
      Open Main Page Using Chrome Browser
      Home Page To Login Email Page
      Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
      Klik Tab Semua Pesanan
      Input Text Search Field Tab Semua Pesanan     ${opty_number}
      List First Transaction Selected
      Detail Transaksi Opened
      Click Beli Button From CF
      Input Tambahkan Catatan Nego Field       ${TEXTAREA}
      Click Beli Button From CF From Pop Up Order Buy
      Message Success Order Buy
      Close Browser



Approve By Approver CF
      [Arguments]               ${EMAIL_APPROVER}      ${PASSWORD}            ${TEXTAREA}
      Open Main Page Using Chrome Browser
      Home Page To Login Email Page
      Login Account Requestor Success      ${EMAIL_APPROVER}      ${PASSWORD}
      Klik Tab Semua Pesanan
      Input Text Search Field Tab Semua Pesanan     ${opty_number}
      List First Transaction Selected
      Detail Transaksi Opened
      Click Setuju Button For Approver From CF
      Input Tambahkan Catatan Approve Field           ${TEXTAREA}
      Click Beli Button From CF From Pop Up Approval Order
      Message Success Buat Order
      Close Browser



Generate SO From CMS
      [Arguments]             ${SELECTALL}
      Open Main Page CMS Using Chrome Browser
      Login Account CMS Success
      Home Pages CMS Opened
      Click Menu Opportunities
      Open Quotation Pages From Opportunities   ${opty_number}               ${SELECTALL}
      Open Quotation
      Click Generate SO Button
      Send Quation Success Message
      Close Browser

