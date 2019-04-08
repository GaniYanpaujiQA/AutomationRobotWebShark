*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/login_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_anggota_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SKU_NUMBER}         b1@grr.la
*** Test Cases ***
Open Daftar Department
    [Template]    Open Daftar Department Page

    #SearchData
    ${SKU_NUMBER}

*** Keywords ***
Open Daftar Department Page
        [Arguments]          ${SKU_NUMBER}
        GIVEN Home Page To Login Email Page
        and Login Account Success
        and Sub Menu Unit Bisnis Opened
        and Open Detail Department From Daftar Department Page
        and Click Tab Anggota
        WHEN Input Text Search And Click Icon Search Field Tab Anggota   ${SKU_NUMBER}
        THEN Verify List Anggota    ${SKU_NUMBER}
