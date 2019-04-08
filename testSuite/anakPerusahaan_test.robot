*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/login_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/pengaturanAnakPerusahaan_pages.robot
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
        And Click Button Menu Pengaturan Anak Perusahaan
        WHEN Select Anak Perusahaan          'Anak 2'
        THEN Pop Up Ganti Perusahaan Click Button Lanjut
