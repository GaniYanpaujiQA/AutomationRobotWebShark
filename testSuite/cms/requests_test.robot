*** Settings ***
Library           SeleniumLibrary
Resource          ../../resources.robot
Resource          ../../PageObject/cms/loginCMS_pages.robot
Resource          ../../PageObject/cms/homeCMS_pages.robot
Resource          ../../PageObject/cms/requests_pages.robot
Resource          ../../PageObject/cms/opportunities_pages.robot
Resource          ../../PageObject/cms/quotation_pages.robot
Resource          ../apiTest/getQuotationDetail_test.robot
Test Setup        Open Main Page CMS Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
${CATATANTRANSAKSI}   SADASDASasda
${ADDRESS}            Parent Child Address 1
${SHIPPINGMETHOD}     ARM1
${PAYMENTMETHOD}      CBD - Bank Transfer > Bank UOB
${NPWP}               Parent Child
${PHONE}              0812312312312
#asdsad
${SHIPPINGNOTE}       Ini Text Area

*** Test Cases ***
Open Requests
    Open Requests Pages

*** Keywords ***
Open Requests Pages
        GIVEN Login Account CMS Success
        And Click Menu Requests
        WHEN Requests Page Opened
        Then Search Data From Requests Page                 RQ000000000000000268
        And Select List Request By Request Number           RQ000000000000000268
        And Click Accept From Pop Up Request Detail
        And Click Save And Continue Button From Basic Info (Step 1)
        And Select Address From Opty Detail (Step 2)     ${ADDRESS}
        And Select Shipping Method From Opty Detail (Step 2)        ${SHIPPINGMETHOD}
        And Select Payment Method From Opty Detail (Step 2)     ${PAYMENTMETHOD}
        And Select Npwp From Opty Detail (Step 2)     ${NPWP}
        And Select Phone From Opty Detail (Step 2)       ${PHONE}
        And Select Shipping Note From Opty Detail (Step 2)    ${SHIPPINGNOTE}
        And Add SKU To Cart From Opty Detail (Step 2)
        And Search By SKU from Pop Up Add SKU (Step 2)
        And Click Select SKU Button from Pop Up Add SKU (Step 2)
        And Click Add To Cart Button from Pop Up Add SKU (Step 2)
        And Click Save And Continue Button From Basic Info (Step 1)
        And Click Create Quotation Button (Step 3)
        And Click Button Send Quatation
        And Pop Up Send Quatation Input Notes               TextArea
        And Pop Up Send Quatation Click Button Send Quatation
        And Send Quation Success Message
        And Quotation Get Number
        And Get Opty Num From Backend
        And Ngambil Data

Ngambil Data
    log to console              ini DAtaa quotation = ${quotation_number}
    log to console              ini DAtaa Opty = ${opty_number}