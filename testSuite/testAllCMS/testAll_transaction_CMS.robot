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
Suite Teardown      Close All Browsers
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
${NPWP}                 Parent Child

${ORDER_NAME}           Order Name
${PHONE}                s
${ADDRESS}              Cms Address 1
${SHIPPINGMETHOD}       ARM1
${PAYMENTMETHOD}        CBD - Bank Transfer > Bank UOB
${NPWP}                 Parent Child
${ACCOUNT_NUMBER}       B2BACC00000000000012
#B2BACC00000000000012 staging
#B2BACC00000000022815 dev
${OPTY_NAME}            Regress Sprint 27 CMS2
${CONTACT_NAME}         cms
*** Test Cases ***
Create Transaction Parent Child Test
#    [Timeout]     5 minute
   Send Quotation From CMS
#    [Teardown]    Close Browser
#    #SearchData           catatan trx                  email requestor        password                   Select Company                 Select NPWP             Opty name           #Select drop list       textarea            ${UNIT_BISNIS}          Adrress                         Shipping Methode            Payment Methode                     Npwp                Phone Numb              EMAIL ADMIN
#    ${SEARCHDATA}        ${CATATANTRANSAKSI}          ${EMAIL_REQUESTOR}      ${PASSWORD}               ${PILIHPERUSAHAAN}              ${PILIHNPWP}            ${OPTYNAME}         ${SELECTALL}            ${TEXTAREA}         ${UNIT_BISNIS}          ${ADDRESS}                      ${SHIPPINGMETHOD}           ${PAYMENTMETHOD}                    ${NPWP}        ${PHONE}                     ${EMAIL_ADMIN}



*** Keywords ***
Send Quotation From CMS
      Open Main Page CMS Using Chrome Browser
      Login Account CMS Success
      Home Pages CMS Opened
      Click Menu Opportunities
      Click New Opty Button
      Select Account Droplist (Step 1)    ${ACCOUNT_NUMBER}
      Iput Opty Name (Step 1)             ${OPTY_NAME}
      Select Contact (Step 1)             ${CONTACT_NAME}

      Click Save And Continue Button From Basic Info (Step 1)
      Select Address From Opty Detail (Step 2)     ${ADDRESS}
      Select Shipping Method From Opty Detail (Step 2)        ${SHIPPINGMETHOD}
      Select Payment Method From Opty Detail (Step 2)     ${PAYMENTMETHOD}
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
      Quotation Get Number
      Click Approve Button CMS Quotation
      Input Quotation ID from POP UP Approve Quotation
      Click Approve Button CMS Quotation from POP UP Approve Quotation
      Click Generate SO Button
      Send Quation Success Message