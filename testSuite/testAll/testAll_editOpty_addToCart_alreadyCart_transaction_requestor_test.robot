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
Suite Teardown      Close All Browsers
# Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
${CATATANTRANSAKSI}   SADASDASasda
${EMAIL_REQUESTOR}    a.parentchildrequestor@grr.la
# ${EMAIL_APPROVER}     a.approver@grr.la    a.parentrequestor@grr.la
${PASSWORD}           Bhinneka321
${UNIT_BISNIS}        childrequestor
# UB2 Requestor       PARENTREQUESTOR
${SELECTALL}          Select All
${TEXTAREA}           SADSAsadsaad asda asdsad
${OPTYNAME}           Opty Name
*** Test Cases ***
Create Transaction Requestor Test
    [Template]    Create Transaction Requestor
    [Teardown]    Close Browser
    #SearchData           catatan trx                  email requestor               password          unitBisnis          Opty name           Select drop list       textarea
    ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}            ${PASSWORD}       ${UNIT_BISNIS}      ${OPTYNAME}         ${SELECTALL}           ${TEXTAREA}
    ${SEARCHDATA}        ${CATATANTRANSAKSI}          a.parentrequestor@grr.la      ${PASSWORD}       Parentrequestor     ${OPTYNAME}         ${SELECTALL}           ${TEXTAREA}
    ${SEARCHDATA}        ${CATATANTRANSAKSI}          a.requestor@grr.la            ${PASSWORD}       UB2 Requestor       ${OPTYNAME}         ${SELECTALL}           ${TEXTAREA}
#    ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}            ${PASSWORD}       ${UNIT_BISNIS}      ${OPTYNAME}         ${SELECTALL}           ${TEXTAREA}
#    ${SEARCHDATA}        ${CATATANTRANSAKSI}          a.parentrequestor@grr.la      ${PASSWORD}       PARENTREQUESTOR     ${OPTYNAME}         ${SELECTALL}           ${TEXTAREA}
#    ${SEARCHDATA}        ${CATATANTRANSAKSI}          a.requestor@grr.la            ${PASSWORD}       UB2 REQUESTOR       ${OPTYNAME}         ${SELECTALL}           ${TEXTAREA}


*** Keywords ***
Create Transaction Requestor
    [Arguments]         ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}            ${PASSWORD}       ${UNIT_BISNIS}      ${OPTYNAME}         ${SELECTALL}           ${TEXTAREA}
    GIVEN Create Transaction Get Opty    ${SEARCHDATA}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}       ${UNIT_BISNIS}     ${OPTYNAME}
    And Send Quotation From CMS       ${SELECTALL}         ${TEXTAREA}
    WHEN Buy Product From CF          ${EMAIL_REQUESTOR}      ${PASSWORD}            ${TEXTAREA}
    THEN Generate SO From CMS         ${SELECTALL}


Create Transaction Get Opty
        [Arguments]          ${SEARCHDATA}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}       ${UNIT_BISNIS}     ${OPTYNAME}
        Open Main Page Using Chrome Browser
        Home Page To Login Email Page
        Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
        Open Detail Page After Search SKU           ${SEARCHDATA}
        Add To Cart Product
        List Transaction Opened    ${UNIT_BISNIS}
        List First Transaction Selected
        Detail Transaksi Opened
        Open Detail Page After Search SKU           ${SEARCHDATA}
        Add To Cart Product
        List Transaction Opened Already Cart        ${UNIT_BISNIS}
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
      Status Approval requestor
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

