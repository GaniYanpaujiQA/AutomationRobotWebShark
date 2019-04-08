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
Resource          ../../PageObject/pengaturanAnakPerusahaan_pages.robot
Resource          ../../PageObject/cms/quotation_pages.robot
Resource         ../../PageObject/daftartransaksi_bantuansales_pages.robot
Resource          ../apiTest/getQuotationDetail_test.robot
Resource          ../../PageObject/cms/requests_pages.robot
Test Setup        SeleniumLibrary.Set Selenium Speed    0.1 s
# Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
${CATATANTRANSAKSI}   SADASDASasda
${EMAIL_REQUESTOR}    a.parentchildrequestor@grr.la
${EMAIL_ADMIN}    a.parentadmin@grr.la
# ${EMAIL_APPROVER}     a.approver@grr.la       a.parentadmin@grr.la    a.parentchild@grr.la
${PASSWORD}           Bhinneka321
${UNIT_BISNIS}        CHILDREQUESTOR
#UB2 Requestor
${SELECTALL}          Select All
${TEXTAREA}           SADSAsadsaad asda asdsad

${PILIHPERUSAHAAN}      PT_TBK Parent Child
${PILIHNPWP}            Parent Child (Child)
${OPTYNAME}             Opty Name New
${NPWP}                 Parent Child

${ORDER_NAME}           Order Name
${PHONE}                0812312312312
${ADDRESS}              Parent Child Address 1
${SHIPPINGMETHOD}       ARM1
${PAYMENTMETHOD}        CBD - Bank Transfer > Bank UOB
${NPWP}                 Parent Child

*** Test Cases ***
Create Transaction Parent Child Test
    [Timeout]     5 minute
    [Template]    Create Transaction Parent Child
    [Teardown]    Close Browser
    #SearchData           catatan trx                  email requestor        password                   Select Company                 Select NPWP             Opty name           #Select drop list       textarea            ${UNIT_BISNIS}          Adrress                         Shipping Methode            Payment Methode                     Npwp                Phone Numb              EMAIL ADMIN
    ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}      ${PASSWORD}               ${PILIHPERUSAHAAN}              ${PILIHNPWP}            ${OPTYNAME}         ${SELECTALL}            ${TEXTAREA}         ${UNIT_BISNIS}          ${ADDRESS}                      ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}        ${PHONE}                     ${EMAIL_ADMIN}

#${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}      ${PASSWORD}               ${PILIHPERUSAHAAN}              ${PILIHNPWP}            ${OPTYNAME}         ${SELECTALL}            ${TEXTAREA}         ${UNIT_BISNIS}          ${ADDRESS}                      ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}        ${PHONE}                     ${EMAIL_ADMIN}


*** Keywords ***

Create Transaction Parent Child
    [Arguments]                     ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}      ${PASSWORD}               ${PILIHPERUSAHAAN}              ${PILIHNPWP}            ${OPTYNAME}         ${SELECTALL}            ${TEXTAREA}             ${UNIT_BISNIS}               ${ADDRESS}                      ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}        ${PHONE}                ${EMAIL_ADMIN}
    GIVEN Create Transaction Get Opty                   ${SEARCHDATA}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}           ${PILIHPERUSAHAAN}      ${PILIHNPWP}        ${OPTYNAME}              ${UNIT_BISNIS}
    And Send Quotation From CMS                         ${SELECTALL}         ${TEXTAREA}             ${ADDRESS}                      ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}        ${PHONE}
    WHEN Buy Product From CF                           ${EMAIL_ADMIN}      ${PASSWORD}            ${TEXTAREA}          ${PILIHPERUSAHAAN}
    THEN Generate SO From CMS                           ${SELECTALL}


Create Transaction Get Opty
      [Arguments]          ${SEARCHDATA}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}           ${PILIHPERUSAHAAN}      ${PILIHNPWP}        ${OPTYNAME}           ${UNIT_BISNIS}
      Open Main Page Using Chrome Browser
      Home Page To Login Email Page
      Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
#      Click Button Menu Transaksi
      Klik Tab Semua Pesanan
      Click Beli Dengan Bantuan Button
      Input Nama Order Text Field From Pop Up Pembelian dengan bantuan Sales                    ${ORDER_NAME}
#      Select Department From Pop Up Pembelian dengan bantuan Sales                              ${UNIT_BISNIS}
      Input Pesan Untuk Sales Text Field From Pop Up Pembelian dengan bantuan Sales               ${TEXTAREA}
      Click Submit Dengan Bantuan Button From Pop Up Pembelian dengan bantuan Sales
      Click Kembali Ke Dashboard Button From Pop Up Permintaan bantuan diproses
      Klik Tab Bantuan Sales
      Get Request Number Bantuan Sales Tab




Send Quotation From CMS
       [Arguments]             ${SELECTALL}         ${TEXTAREA}             ${ADDRESS}                      ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}        ${PHONE}
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
#      Select Npwp From Opty Detail (Step 2)     ${NPWP}
      Select Phone From Opty Detail (Step 2)       ${PHONE}
      Select Shipping Note From Opty Detail (Step 2)    ${TEXTAREA}
      Add SKU To Cart From Opty Detail (Step 2)
      Search By SKU from Pop Up Add SKU (Step 2)
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
      [Arguments]               ${EMAIL_ADMIN}      ${PASSWORD}            ${TEXTAREA}          ${PILIHPERUSAHAAN}
      Open Main Page Using Chrome Browser
      Home Page To Login Email Page
      Login Account Requestor Success      ${EMAIL_ADMIN}      ${PASSWORD}
      Click Button Menu Pengaturan Anak Perusahaan
      Select Anak Perusahaan          ${PILIHPERUSAHAAN}
      Pop Up Ganti Perusahaan Click Button Lanjut
      Klik Tab Semua Pesanan
      Input Text Search Field Tab Semua Pesanan For Anak Perusahaan        ${opty_number}
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
