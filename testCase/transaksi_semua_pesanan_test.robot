*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/daftarTransaksi_semuaPesanan_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         a
${STATUS}             Draft
${STARDATE}           14 Jan 2019
${ENDDATE}            13 Feb 2019
${DEPARTMENT}         Semua
*** Test Cases ***
Open Transaksi Semua Pesanan
        [Template]       Open Transaksi Semua Pesanan Page
        #SEARCHDATA   STATUS              starDate          endDate        Department
        ${SEARCHDATA}     ${STATUS}       ${STARDATE}       ${ENDDATE}     ${DEPARTMENT}
*** Keywords ***
Open Transaksi Semua Pesanan Page
        [Arguments]    ${SEARCHDATA}     ${STATUS}        ${STARDATE}       ${ENDDATE}      ${DEPARTMENT}
        GIVEN Page Transaksi Semua Pesanan Already Opened
        WHEN Click Menu Transaksi Semua Pesanan
        THEN Page Transaksi Semua Pesanan will be displayed    ${SEARCHDATA}     ${STATUS}      ${STARDATE}       ${ENDDATE}     ${DEPARTMENT}


Page Transaksi Semua Pesanan Already Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password

Click Menu Transaksi Semua Pesanan
        Menu Profil Already Opened
        Click Button Menu Transaksi


Page Transaksi Semua Pesanan will be displayed
        [Arguments]       ${SEARCHDATA}       ${STATUS}     ${STARDATE}       ${ENDDATE}    ${DEPARTMENT}
        Klik Tab Semua Pesanan
        Tab Semua Pesanan Already Opened
        Input Text Search Field Tab Semua Pesanan    ${SEARCHDATA}
        Select Droplist Status Tab Semua Pesanan    ${STATUS}
        Select Droplist Department Tab Semua Pesanan        ${DEPARTMENT}
        Select Droplist Bantuan Sales Tab Semua Pesanan    ${DEPARTMENT}
        Select Star and End Date Tab Semua Pesanan    ${STARDATE}    ${ENDDATE}
        Close Window
