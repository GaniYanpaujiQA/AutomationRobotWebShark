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
${SKU_NUMBER}        SKU00717707
${CATATANTRANSAKSI}   SADASDASasda
${EMAIL_REQUESTOR}    a.parentchildrequestor@grr.la
#a.approver@grr.la
${EMAIL_APPROVER}     a.parentchildapprover@grr.la
${PASSWORD}           Bhinneka321
${UNIT_BISNIS}        CHILDAPPROVER
# UB1
${SELECTALL}          Select All
${TEXTAREA}           SADSAsadsaad asda asdsad
${OPTYNAME}            asdsss
*** Test Cases ***
Create Transaction Test
    [Timeout]       5 minute
    [Template]    Create Transaction Get Opty
    [Teardown]    Close Browser
    #SearchData           catatan trx                  email requestor        password          unitBisnis              Opty name
    ${SKU_NUMBER}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}      ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}

Send Quotation From CMS Test
    [Timeout]       5 minute
    [Template]    Send Quotation From CMS
    [Teardown]    Close Browser
    #Select drop list       textarea
    ${SELECTALL}            ${TEXTAREA}

Buy Product From CF Test
    [Timeout]       10 minute
    [Template]    Buy Product From CF
    [Teardown]    Close Browser
    # email requestor        password          textArea
    ${EMAIL_REQUESTOR}      ${PASSWORD}       ${TEXTAREA}

Buy Approve Transaction From CF Test
    [Timeout]       10 minute
    [Template]    Approve By Approver CF
    [Teardown]    Close Browser
        # [Teardown]    Close Browser
        # email requestor        password          textArea
    ${EMAIL_APPROVER}      ${PASSWORD}       ${TEXTAREA}

Generate SO From CMS Test
    [Timeout]       10 minute
    [Template]      Generate SO From CMS
    [Teardown]      Close Browser
    #Select All
    ${SELECTALL}
*** Keywords ***
Create Transaction Get Opty
        [Arguments]          ${SKU_NUMBER}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}
        GIVEN Open Main Page Using Chrome Browser
        And Home Page To Login Email Page
        And Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
        And Open Detail Page After Search SKU           ${SKU_NUMBER}
        And Add To Cart Product
        And List Transaction Opened    ${UNIT_BISNIS}
        And List First Transaction Selected
        WHEN Detail Transaksi Opened
        And Update Opty From Page Detail Transaction    ${OPTYNAME}
        And Click Submit Button From Detail Transaksi
        And Input Tambahkan Catatan Field     ${opty_number}
        And Click Buat Order Button
        THEN Message Success Buat Order



Send Quotation From CMS
       [Arguments]             ${SELECTALL}         ${TEXTAREA}
       GIVEN Open Main Page CMS Using Chrome Browser
       And Login Account CMS Success
       And Home Pages CMS Opened
       And Click Menu Opportunities
       And Open Quotation Pages From Opportunities   ${opty_number}               ${SELECTALL}
       And Open Quotation
       WHEN Click Button Send Quatation
       And Pop Up Send Quatation Input Notes     ${TEXTAREA}
       And Pop Up Send Quatation Click Button Send Quatation
       THEN Send Quation Success Message


Buy Product From CF
      [Arguments]               ${EMAIL_REQUESTOR}      ${PASSWORD}            ${TEXTAREA}
      GIVEN Open Main Page Using Chrome Browser
      And Home Page To Login Email Page
      And Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
      And Klik Tab Semua Pesanan
      And Input Text Search Field Tab Semua Pesanan     ${opty_number}
      And List First Transaction Selected
      WHEN Detail Transaksi Opened
      And Click Beli Button From CF
      And Input Tambahkan Catatan Nego Field       ${TEXTAREA}
      And Click Beli Button From CF From Pop Up Order Buy
      THEN Message Success Order Buy


Approve By Approver CF
      [Arguments]               ${EMAIL_APPROVER}      ${PASSWORD}            ${TEXTAREA}
      GIVEN Open Main Page Using Chrome Browser
      And Home Page To Login Email Page
      And Login Account Requestor Success      ${EMAIL_APPROVER}      ${PASSWORD}
      And Klik Tab Semua Pesanan
      And Input Text Search Field Tab Semua Pesanan     ${opty_number}
      And List First Transaction Selected
      WHEN Detail Transaksi Opened
      And Click Setuju Button For Approver From CF
      And Input Tambahkan Catatan Approve Field           ${TEXTAREA}
      And Click Beli Button From CF From Pop Up Approval Order
      THEN Message Success Buat Order


Generate SO From CMS
      [Arguments]             ${SELECTALL}
      GIVEN Open Main Page CMS Using Chrome Browser
      And Login Account CMS Success
      And Home Pages CMS Opened
      And Click Menu Opportunities
      And Open Quotation Pages From Opportunities   ${opty_number}               ${SELECTALL}
      And Open Quotation
      WHEN Click Generate SO Button
      THEN Send Quation Success Message
