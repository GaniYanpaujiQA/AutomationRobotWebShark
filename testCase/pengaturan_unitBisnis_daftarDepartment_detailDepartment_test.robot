*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_pages.robot
Resource          ../PageObject/pengaturan/unitBisnis/daftarDepartment_detailDepartment_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${KODEDEPARTMENT}             12311
${NAMADEPARTMENT}             Name Dep
${BATASHARGABARANG}           40000
${BATASTRANSAKSI}             400000
${TIPEPERSETUJUAN}             Persetujuan 2 Tingkat

*** Test Cases ***
Edit Department
        [Template]    Pengaturan Unit Bisnis Edit Department
        # KODEDEPARTMENT          NAMADEPARTMENT          BATASHARGABARANG      BATASTRANSAKSI     TIPEPERSETUJUAN
        ${KODEDEPARTMENT}       ${NAMADEPARTMENT}         ${BATASHARGABARANG}  ${BATASTRANSAKSI}   ${TIPEPERSETUJUAN}
*** Keywords ***
Pengaturan Unit Bisnis Edit Department
        [Arguments]     ${KODEDEPARTMENT}       ${NAMADEPARTMENT}         ${BATASHARGABARANG}  ${BATASTRANSAKSI}   ${TIPEPERSETUJUAN}
        GIVEN Page Edit Department Opened
        WHEN Input All Field Click Button Simpan From Page Edit Department    ${KODEDEPARTMENT}       ${NAMADEPARTMENT}         ${BATASHARGABARANG}  ${BATASTRANSAKSI}   ${TIPEPERSETUJUAN}
        THEN Message Success will be displayed From Page Edit Department

Page Edit Department Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password
        Menu Profil Already Opened
        Sub Menu Unit Bisnis Opened
        Open Detail Department From Daftar Department Page
        Edit Department Already Opened


Input All Field Click Button Simpan From Page Edit Department
        [Arguments]         ${KODEDEPARTMENT}       ${NAMADEPARTMENT}         ${BATASHARGABARANG}  ${BATASTRANSAKSI}   ${TIPEPERSETUJUAN}
        Input Department Code Text Field From Edit Department      ${KODEDEPARTMENT}
        Input Department Name From Edit Department        ${NAMADEPARTMENT}
        Input Batas Harga Barang Text Field From Edit Department        ${BATASHARGABARANG}
        Input Batas Transaksi Text Field From Edit Department       ${BATASTRANSAKSI}
        Input Tipe Persetujuan Drop List From Edit Department       ${TIPEPERSETUJUAN}
        Click Button Simpan From Edit Department
        Click Button Lanjut From Pop Up Perubahaan Tingkat Approval On Edit Department Page

Message Success will be displayed From Page Edit Department
        Message Success From Edit Department
        Close Window
