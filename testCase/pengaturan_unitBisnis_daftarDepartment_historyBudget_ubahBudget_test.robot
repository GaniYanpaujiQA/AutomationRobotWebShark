*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_detailDepartment_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_historyBudget_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_historyBudget_ubahBudget_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${PENAMBAHANHARGA}    1200000
${KETERANGAN}         Keterangan
*** Test Cases ***
Open Ubah Budget
            [Template]  Open Ubah Budget Pages
                # Penambahan                  keterangan
                ${PENAMBAHANHARGA}          ${KETERANGAN}
*** Keywords ***
Open Ubah Budget Pages
        [Arguments]            ${PENAMBAHANHARGA}          ${KETERANGAN}
        GIVEN Page Ubah Budget Opened
        WHEN Input Penambahan and Input Keterangan and Click Sesuaikan Budget             ${PENAMBAHANHARGA}          ${KETERANGAN}
        THEN List New Ubah Gedget Will Be Displayed       ${KETERANGAN}


Page Ubah Budget Opened
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
      Click Ubah Budget Button
      Page Ubah Budgets Already Opened

Input Penambahan and Input Keterangan and Click Sesuaikan Budget
        [Arguments]         ${PENAMBAHANHARGA}          ${KETERANGAN}
        Input Text Penambahan Field Tab Ubah Budgets    ${PENAMBAHANHARGA}
        Input Text Keterangan Field Tab Ubah Budgets    ${KETERANGAN}
        Click Button Sesuaikan Budget
        Click Button Lanjut From Pop Up Penyesuaian Budget

List New Ubah Gedget Will Be Displayed
        [Arguments]       ${KETERANGAN}
        History Budget By Keterangan Ubah Budget      ${KETERANGAN}
        Close Window
