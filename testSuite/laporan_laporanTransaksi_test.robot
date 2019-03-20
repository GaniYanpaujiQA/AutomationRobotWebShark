*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/laporan_laporantransaksi_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${STARDATE}           14 Jan 2019
${ENDDATE}            13 Feb 2019
${DEPARTMENT}         Semua
*** Test Cases ***
Open Laporan Transaksi
        [Template]       Open Laporan Transaksi Page
        #$DEPARTMENT     starDate          endDate
      ${DEPARTMENT}    ${STARDATE}       ${ENDDATE}
*** Keywords ***
Open Laporan Transaksi Page
        [Arguments]         ${DEPARTMENT}     ${STARDATE}       ${ENDDATE}
        GIVEN Page Laporan Transaksi Opened
        WHEN Select Department and Choose Jangka Waktu     ${DEPARTMENT}      ${STARDATE}       ${ENDDATE}
        THEN Report List Will Be Displayed


Page Laporan Transaksi Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password
        Menu Profil Already Opened
        Klik Button Menu Laporan

Select Department and Choose Jangka Waktu
        [Arguments]           ${DEPARTMENT}     ${STARDATE}       ${ENDDATE}
        Klik Tab Laporan Transaksi
        Tab Laporan Transaksi Already Opened
        Select Droplist Department Tab Laporan Transaksi    ${DEPARTMENT}
        Select Star and End Date Tab Laporan Transaksi    ${STARDATE}    ${ENDDATE}

Report List Will Be Displayed
        Report List
        Close Window
