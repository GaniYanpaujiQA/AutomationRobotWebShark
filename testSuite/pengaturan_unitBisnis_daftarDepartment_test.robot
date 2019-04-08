*** Settings ***
Resource          ../resources.robot
Resource          ../pages/loginEmail_pages.robot
Resource          ../pages/loginPassword_pages.robot
Resource          ../pages/home_pages.robot
Resource          ../pages/menu_pages.robot
Resource          ../pages/pengaturan/unitBisnis/daftarDepartment_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SKU_NUMBER}         ND
*** Test Cases ***
Open Daftar Department
    [Template]    Open Daftar Department Page
    #SearchData
    ${SKU_NUMBER}

*** Keywords ***
Open Daftar Department Page
        [Arguments]          ${SKU_NUMBER}
        GIVEN Page Daftar Department Already Opened
        WHEN Input Text to Search Field    ${SKU_NUMBER}
        THEN List Based on Department Name Will Be Displayed


Page Daftar Department Already Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password
        Menu Profil Already Opened
        Click Button Menu Pengaturan
        Click Button Menu Pengaturan Submenu Unit Bisnis

Input Text to Search Field
        [Arguments]          ${SKU_NUMBER}
        Daftar Department Already Opened
        Input Text For Use Field Search          ${SKU_NUMBER}


List Based on Department Name Will Be Displayed
        List Acoount Showed
        Close Window
