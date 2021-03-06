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
Resource         ../../PageObject/daftartransaksi_bantuansales_pages.robot
Resource          ../apiTest/getQuotationDetail_test.robot
Resource          ../../PageObject/cms/requests_pages.robot
Test Setup        SeleniumLibrary.Set Selenium Speed    0.3 s
# Test Setup        Open Main Page Using Chrome Browser
Suite Teardown      Close All Browsers

*** Variables ***
${SKU_NUMBER}        SKU00717707
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
${ORDER_NAME}           Order Name
${PHONE}              asdsad
${ADDRESS}              Parent Child Address 1
${SHIPPINGMETHOD}       ARM1
${PAYMENTMETHOD}        CBD - Bank Transfer > Bank UOB
${NPWP}                 Parent Child
*** Test Cases ***
Create Transaction Approver Test
    [Timeout]       20 minute
    [Template]    Create Transaction Approver
    #SearchData           catatan trx                  email requestor                 password          unitBisnis              Opty name               Select drop list       textarea         email Approver                           OrderName           Adrress                         Shipping Methode            Payment Methode                     Npwp                Phone Numb
    ${SKU_NUMBER}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}               ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     ${EMAIL_APPROVER}                        ${ORDER_NAME}       ${ADDRESS}                      ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}              ${PHONE}
    ${SKU_NUMBER}        ${CATATANTRANSAKSI}          a.parentrequestor@grr.la         ${PASSWORD}       parentapprover          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     a.parentapprover@grr.la                   ${ORDER_NAME}        Parent Admin Address 1         ARM1                        ${PAYMENTMETHOD}                    -                   Rumah
    ${SKU_NUMBER}        ${CATATANTRANSAKSI}          a.requestor@grr.la               ${PASSWORD}       UB1                     ${OPTYNAME}             ${SELECTALL}              ${TEXTAREA}     a.approver@grr.la                        ${ORDER_NAME}       Organisasi A Address 1         ARM1                        ${PAYMENTMETHOD}                   -                  0812313123123
#
# ${SKU_NUMBER}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}               ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     ${EMAIL_APPROVER}                        ${ORDER_NAME}       ${ADDRESS}                      ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}              ${PHONE}
#    ${SKU_NUMBER}        ${CATATANTRANSAKSI}          a.parentrequestor@grr.la         ${PASSWORD}       PARENTAPPROVER          ${OPTYNAME}             ${SELECTALL}            ${TEXTAREA}     a.parentapprover@grr.la                   ${ORDER_NAME}        Parent Admin Address 1         ARM1                        ${PAYMENTMETHOD}                    -                   wsdasd
#    ${SKU_NUMBER}        ${CATATANTRANSAKSI}          a.requestor@grr.la               ${PASSWORD}       UB1                     ${OPTYNAME}             ${SELECTALL}              ${TEXTAREA}     a.approver@grr.la                        ${ORDER_NAME}       Admin Default Address 1          ARM1                        ${PAYMENTMETHOD}                   -                  asdsadsad

*** Keywords ***
Create Transaction Approver
    [Arguments]                  ${SKU_NUMBER}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}               ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}             ${SELECTALL}          ${TEXTAREA}     ${EMAIL_APPROVER}           ${ORDER_NAME}       ${ADDRESS}                 ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}            ${NPWP}               ${PHONE}
    GIVEN Create Transaction Get Opty       ${SKU_NUMBER}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}       ${UNIT_BISNIS}       ${OPTYNAME}                 ${ORDER_NAME}            ${TEXTAREA}
    And Send Quotation From CMS      ${SELECTALL}         ${TEXTAREA}           ${ADDRESS}                 ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}              ${NPWP}            ${PHONE}
    And Buy Product From CF          ${EMAIL_REQUESTOR}      ${PASSWORD}            ${TEXTAREA}
    WHEN Approve By Approver CF      ${EMAIL_APPROVER}      ${PASSWORD}            ${TEXTAREA}
    THEN Generate SO From CMS        ${SELECTALL}

Create Transaction Get Opty
        [Arguments]          ${SKU_NUMBER}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}       ${UNIT_BISNIS}          ${OPTYNAME}             ${ORDER_NAME}                    ${TEXTAREA}
      Open Main Page Using Chrome Browser
      Home Page To Login Email Page
      Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
      Klik Tab Semua Pesanan
      Click Beli Dengan Bantuan Button
      Input Nama Order Text Field From Pop Up Pembelian dengan bantuan Sales                    ${ORDER_NAME}
      Select Department From Pop Up Pembelian dengan bantuan Sales                ${UNIT_BISNIS}
      Input Pesan Untuk Sales Text Field From Pop Up Pembelian dengan bantuan Sales               ${TEXTAREA}
      Click Submit Dengan Bantuan Button From Pop Up Pembelian dengan bantuan Sales
      Click Kembali Ke Dashboard Button From Pop Up Permintaan bantuan diproses
      Klik Tab Bantuan Sales
      Get Request Number Bantuan Sales Tab





Send Quotation From CMS
      [Arguments]             ${SELECTALL}         ${TEXTAREA}                     ${ADDRESS}                 ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}        ${PHONE}
      Open Main Page CMS Using Chrome Browser
      Login Account CMS Success
      Home Pages CMS Opened
      Click Menu Requests
      Requests Page Opened
      Search Data From Requests Page                 ${request_number}
      Select List Request By Request Number           ${request_number}
      Click Accept From Pop Up Request Detail
      Click Save And Continue Button From Basic Info (Step 1)
      Select Address From Opty Detail (Step 2)     ${ADDRESS}
      Select Shipping Method From Opty Detail (Step 2)        ${SHIPPINGMETHOD}
      Select Payment Method From Opty Detail (Step 2)     ${PAYMENTMETHOD}
      Select Npwp From Opty Detail (Step 2)     ${NPWP}
      Select Phone From Opty Detail (Step 2)       ${PHONE}
      Select Shipping Note From Opty Detail (Step 2)    ${TEXTAREA}
      Add SKU To Cart From Opty Detail (Step 2)
      Search By SKU from Pop Up Add SKU (Step 2)        ${SKU_NUMBER}
      Click Select SKU Button from Pop Up Add SKU (Step 2)
      Click Add To Cart Button from Pop Up Add SKU (Step 2)
      Click Save And Continue Button From Basic Info (Step 1)
      Click Create Quotation Button (Step 3)
      Click Button Send Quatation
      Pop Up Send Quatation Input Notes               ${TEXTAREA}
      Pop Up Send Quatation Click Button Send Quatation
#      Send Quation Success Message
      Quotation Get Number
      Get Opty Num From Backend



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

