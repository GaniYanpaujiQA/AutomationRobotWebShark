*** Settings ***
Resource          ../resources.robot
Resource          ../pages/loginEmail_pages.robot
Resource          ../pages/loginPassword_pages.robot
Resource          ../pages/home_pages.robot
Resource          ../pages/menu_pages.robot
Resource          ../pages/daftartransaksi_bantuansales_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         a
${STATUS}             Permintaan
${STARDATE}           14 Jan 2019
${ENDDATE}            13 Feb 2019
*** Test Cases ***
Open Transaksi Bantuan Sales
        [Template]       Open Transaksi  Bantuan Sales Page
        #SEARCHDATA   STATUS              starDate          endDate
        ${SEARCHDATA}     ${STATUS}       ${STARDATE}       ${ENDDATE}
*** Keywords ***
Open Transaksi Bantuan Sales Page
        [Arguments]    ${SEARCHDATA}     ${STATUS}        ${STARDATE}       ${ENDDATE}
        GIVEN Page Transaksi Bantuan Sales Already Opened
        WHEN Click Menu Transaksi Bantuan Sales
        THEN Page Transaksi Bantuan Sales will be displayed    ${SEARCHDATA}     ${STATUS}      ${STARDATE}       ${ENDDATE}


Page Transaksi Bantuan Sales Already Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password

Click Menu Transaksi Bantuan Sales
        Menu Profil Already Opened
        Klik Button Menu Transaksi

Page Transaksi Bantuan Sales will be displayed
        [Arguments]       ${SEARCHDATA}       ${STATUS}     ${STARDATE}       ${ENDDATE}
        Klik Tab Bantuan Sales
        Tab Bantuan Sales Already Opened
        Input Text Search Field Tab Bantuan Sales    ${SEARCHDATA}
        Select Droplist Status Tab Bantuan Sales    ${STATUS}
        Select Star and End Date Tab Bantuan Sales   ${STARDATE}    ${ENDDATE}
        Close Window
