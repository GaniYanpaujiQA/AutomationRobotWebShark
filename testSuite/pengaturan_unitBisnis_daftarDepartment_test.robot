*** Settings ***
Resource          ../resources.robot
Resource          ../pages/loginEmail_pages.robot
Resource          ../pages/loginPassword_pages.robot
Resource          ../pages/home_pages.robot
Resource          ../pages/menu_pages.robot
Resource          ../pages/pengaturan/unitBisnis/daftarDepartment_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         ND
*** Test Cases ***
Open Daftar Department
    [Template]    Open Daftar Department Page
    #SearchData
    ${SEARCHDATA}

*** Keywords ***
Open Daftar Department Page
        [Arguments]          ${SEARCHDATA}
        GIVEN Page Daftar Department Already Opened
        WHEN Input Text to Search Field    ${SEARCHDATA}
        THEN List Based on Department Name Will Be Displayed


Page Daftar Department Already Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password
        Menu Profil Already Opened
        Click Button Menu Pengaturan
        Click Button Menu Pengaturan Submenu Unit Bisnis

Input Text to Search Field
        [Arguments]          ${SEARCHDATA}
        Daftar Department Already Opened
        Input Text For Use Field Search          ${SEARCHDATA}


List Based on Department Name Will Be Displayed
        List Acoount Showed
        Close Window
