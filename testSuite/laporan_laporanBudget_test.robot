*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/laporan_laporanBudget_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${STARDATE}           14 Jan 2019
${ENDDATE}            13 Feb 2019
${DEPARTMENT}         Semua
*** Test Cases ***
Open Laporan Budget
        [Template]       Open Laporan Budget Page
        #$DEPARTMENT     starDate          endDate
      ${DEPARTMENT}    ${STARDATE}       ${ENDDATE}
*** Keywords ***
Open Laporan Budget Page
        [Arguments]         ${DEPARTMENT}     ${STARDATE}       ${ENDDATE}
        GIVEN Page Laporan Budget Opened
        WHEN Select Department and Choose Jangka Waktu From Laporan Budget   ${DEPARTMENT}      ${STARDATE}       ${ENDDATE}
        THEN Report List Will Be Displayed From Laporan Budget


Page Laporan Budget Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password
        Menu Profil Already Opened
        Klik Button Menu Laporan

Select Department and Choose Jangka Waktu From Laporan Budget
        [Arguments]           ${DEPARTMENT}     ${STARDATE}       ${ENDDATE}
        Klik Tab Laporan Budget
        Tab Laporan Budget Already Opened
        Select Droplist Department Tab Laporan Budget    ${DEPARTMENT}
        Select Star and End Date Tab Laporan Budget    ${STARDATE}    ${ENDDATE}

Report List Will Be Displayed From Laporan Budget
        Report List
        Close Window
