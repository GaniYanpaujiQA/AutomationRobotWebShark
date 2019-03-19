*** Settings ***
Resource          ../resources.robot
Resource          ../pages/loginEmail_pages.robot
Resource          ../pages/loginPassword_pages.robot
Resource          ../pages/home_pages.robot
Resource          ../pages/menu_pages.robot
Resource          ../pages/daftarTransaksi_pesananBerjalan_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         a
${STATUS}             Draft
${STARDATE}           14 Jan 2019
${ENDDATE}            13 Feb 2019
*** Test Cases ***
Open Transaksi Pesanan Berjalan
        [Template]       Open Transaksi Pesanan Berjalan Page
        #SEARCHDATA   STATUS              starDate          endDate
        ${SEARCHDATA}     ${STATUS}       ${STARDATE}       ${ENDDATE}
*** Keywords ***
Open Transaksi Pesanan Berjalan Page
        [Arguments]    ${SEARCHDATA}     ${STATUS}        ${STARDATE}       ${ENDDATE}
        GIVEN Page Transaksi Pesanan Berjalan Already Opened
        WHEN Click Menu Transaksi Pesanan Berjalan
        THEN Page Transaksi Pesanan Berjalan will be displayed    ${SEARCHDATA}     ${STATUS}      ${STARDATE}       ${ENDDATE}


Page Transaksi Pesanan Berjalan Already Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password

Click Menu Transaksi Pesanan Berjalan
        Menu Profil Already Opened
        Klik Button Menu Transaksi


Page Transaksi Pesanan Berjalan will be displayed
        [Arguments]       ${SEARCHDATA}       ${STATUS}     ${STARDATE}       ${ENDDATE}
        Klik Tab Pesanan Berjalan
        Tab Pesanan berjalan Already Opened
        Input Text Search Field    ${SEARCHDATA}
        Select Droplist Status    ${STATUS}
        Select Star and End Date    ${STARDATE}    ${ENDDATE}
        Close Window
