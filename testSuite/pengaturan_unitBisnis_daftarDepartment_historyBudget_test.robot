*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_detailDepartment_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_historyBudget_pages.robot
Test Setup        Open Main Page Using Chrome Browser


*** Variables ***
${STARDATE}           14 Jan 2019
${ENDDATE}            13 Feb 2019
${SEARCH}             asaaa
*** Test Cases ***
Open Histori Budget
        [Template]       Open Histori Budget Page
        #$DEPARTMENT     starDate          endDate
      ${SEARCH}
*** Keywords ***
Open Histori Budget Page
        [Arguments]         ${SEARCH}
        GIVEN Page Histori Budget Opened
        WHEN Input Search Textbox and Choose Jangka Waktu Droplist   ${SEARCH}
        THEN History Budget List Will Be Displayed


Page Histori Budget Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password
        Menu Profil Already Opened
        Click Button Menu Pengaturan
        Click Button Menu Pengaturan Submenu Unit Bisnis
        Open Detail Department From Daftar Department Page
        Edit Department Already Opened
        Click Tab Histori Budgets
        Tab Histori Budgets Already Opened

Input Search Textbox and Choose Jangka Waktu Droplist
        [Arguments]           ${SEARCH}
        Input Text Search Field Tab Histori Budgets    ${SEARCH}
        # Select Star and End Date Tab Laporan Transaksi    ${STARDATE}    ${ENDDATE}

History Budget List Will Be Displayed
        Report List Histori Budget
        Close Window
