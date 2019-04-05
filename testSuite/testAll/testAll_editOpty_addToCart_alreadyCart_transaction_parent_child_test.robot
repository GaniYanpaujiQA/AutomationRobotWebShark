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
# Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
${CATATANTRANSAKSI}   SADASDASasda
${EMAIL_REQUESTOR}    a.parentadmin@grr.la
# ${EMAIL_APPROVER}     a.approver@grr.la       a.parentadmin@grr.la    a.parentchild@grr.la
${PASSWORD}           Bhinneka321
${UNIT_BISNIS}        UB2 Requestor
${SELECTALL}          Select All
${TEXTAREA}           SADSAsadsaad asda asdsad

${PILIHPERUSAHAAN}          PT_TBK Parent Child
#PT_PERSERO Parent Child
${PILIHNPWP}            Parent Child (Child)
${OPTYNAME}             Opty Name New
*** Test Cases ***
Create Transaction Parent Child Test
    [Timeout]     5 minute
    [Template]    Create Transaction Parent Child
    [Teardown]    Close Browser
    #SearchData           catatan trx                  email requestor        password                   Select Company                 Select NPWP             Opty name           #Select drop list       textarea
    ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}      ${PASSWORD}               ${PILIHPERUSAHAAN}              ${PILIHNPWP}            ${OPTYNAME}         ${SELECTALL}            ${TEXTAREA}



*** Keywords ***

Create Transaction Parent Child
    [Arguments]                     ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}      ${PASSWORD}               ${PILIHPERUSAHAAN}              ${PILIHNPWP}            ${OPTYNAME}         ${SELECTALL}            ${TEXTAREA}
    GIVEN Create Transaction Get Opty                   ${SEARCHDATA}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}           ${PILIHPERUSAHAAN}      ${PILIHNPWP}        ${OPTYNAME}
    And Send Quotation From CMS                         ${SELECTALL}         ${TEXTAREA}
    WHEN Buy Product From CF                           ${EMAIL_REQUESTOR}      ${PASSWORD}            ${TEXTAREA}          ${PILIHPERUSAHAAN}
    THEN Generate SO From CMS                           ${SELECTALL}


Create Transaction Get Opty
        [Arguments]          ${SEARCHDATA}         ${CATATANTRANSAKSI}        ${EMAIL_REQUESTOR}      ${PASSWORD}           ${PILIHPERUSAHAAN}      ${PILIHNPWP}        ${OPTYNAME}
        Open Main Page Using Chrome Browser
        Home Page To Login Email Page
        Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
        Open Detail Page After Search SKU           ${SEARCHDATA}
        Add To Cart Product
        List Transaction Opened With Select Company    ${PILIHPERUSAHAAN}
        List First Transaction Selected
        Detail Transaksi Opened
        Open Detail Page After Search SKU           ${SEARCHDATA}
        Add To Cart Product
        List Transaction Opened With Select Company Cart Already Used        ${PILIHPERUSAHAAN}
        List First Transaction Selected
        Detail Transaksi Opened
        Update Opty From Page Detail Transaction    ${OPTYNAME}
        Click Submit Button From Detail Transaksi
        Select NPWP                     ${PILIHNPWP}
        Input Tambahkan Catatan Field     ${opty_number}
        Click Buat Order Button
        Message Success Buat Order
        Click Hyperlink Kembali
        Klik Tab Semua Pesanan
        Input Text Search Field Tab Semua Pesanan For Anak Perusahaan      ${opty_number}
        Compare Opty Name    ${OPTYNAME}
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
      [Arguments]               ${EMAIL_REQUESTOR}      ${PASSWORD}            ${TEXTAREA}          ${PILIHPERUSAHAAN}
      Open Main Page Using Chrome Browser
      Home Page To Login Email Page
      Login Account Requestor Success      ${EMAIL_REQUESTOR}      ${PASSWORD}
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
