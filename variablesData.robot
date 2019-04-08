*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/login_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/detail_product_pages.robot
Resource          ../PageObject/detailTransaksi_pages.robot
Resource          ../PageObject/daftarTransaksi_semuaPesanan_pages.robot
Resource          ../PageObject/cms/loginCMS_pages.robot
Resource          ../PageObject/cms/homeCMS_pages.robot
Resource          ../PageObject/cms/opportunities_pages.robot
Resource          ../PageObject/cms/quotation_pages.robot
# Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
${CATATANTRANSAKSI}   SADASDASasda
${EMAIL_REQUESTOR}    a.parentadmin@grr.la
# ${EMAIL_APPROVER}     a.approver@grr.la
${PASSWORD}           Bhinneka321
${UNIT_BISNIS}        UB2 Requestor
${SELECTALL}          Select All
${TEXTAREA}           SADSAsadsaad asda asdsad
${OPTYNAME}             dasdas

*** Keywords ***
Get Data From Environment
[Arguments]                    ${env}
        Run Keyword If       '${ENV}' == 'Staging'
    ...     Set Data Staging
    ...     ELSE
    ...     Set Data Development

Set Data Staging
    ${SEARCHDATA}         3320724191
    ${CATATANTRANSAKSI}   SADASDASasda
    ${EMAIL_REQUESTOR}    a.parentadmin@grr.la
    # ${EMAIL_APPROVER}     a.approver@grr.la
    ${PASSWORD}           Bhinneka321
    ${UNIT_BISNIS}        UB2 Requestor
    ${SELECTALL}          Select All
    ${TEXTAREA}           SADSAsadsaad asda asdsad
    ${OPTYNAME}           dasdas

#    Email Requestor
    ${EMAIL_REQUESTOR1}    a.requestor@grr.la
    ${EMAIL_REQUESTOR2}    a.parentrequestor@grr.la
    ${EMAIL_REQUESTOR3}    a.parentchildrequestor@grr.la

#    Email Admin
    ${EMAIL_ADMIN1}    a.admin@grr.la
    ${EMAIL_ADMIN2}    a.parentadmin@grr.la
    ${EMAIL_ADMIN3}    a.parentchild@grr.la

#    Email APPROVER
    ${EMAIL_APPROVER1}    a.approver@grr.la
    ${EMAIL_APPROVER2}    a.parentapprover@grr.la
    ${EMAIL_APPROVER3}    a.parentchildapprover@grr.la

#   UNIT BISNIS
    ${UNIT_BISNIS1_APPROVER}        UB1
    ${UNIT_BISNIS1_REQUESTOR}       UB2 Requestor
    ${UNIT_BISNIS2_APPROVER}        parentapprover
    ${UNIT_BISNIS2_REQUESTOR}       Parentrequestor
    ${UNIT_BISNIS3_APPROVER}        childapprover
    ${UNIT_BISNIS3_REQUESTOR}       childrequestor


#   ANAK PERUSAHAAN
    ${PILIHPERUSAHAAN2}              PT_PERSERO Parent Child


#   ADDRESS
    ${ADDRESS1}              Parent Admin Address 1
    ${ADDRESS2}              Parent Admin Address 1
    ${ADDRESS3}              Parent Admin Address 1
Set Data Development