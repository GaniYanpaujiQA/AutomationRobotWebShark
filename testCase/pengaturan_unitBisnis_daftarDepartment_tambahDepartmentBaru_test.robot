*** Settings ***
Resource          ../resources.robot
Resource          ../pages/loginEmail_pages.robot
Resource          ../pages/loginPassword_pages.robot
Resource          ../pages/home_pages.robot
Resource          ../pages/menu_pages.robot
resource          ../pages/pengaturan/unitBisnis/daftarDepartment_pages.robot
Resource          ../pages/pengaturan/unitBisnis/daftarDepartment_tambahDepartmentBaru_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${KODEDEPARTMENT}             14
${NAMADEPARTMENT}             Name Dep
${BATASHARGABARANG}           40000
${BATASTRANSAKSI}             400000
${TIPEPERSETUJUAN}             Persetujuan 2 Tingkat

*** Test Cases ***
Tambah Department Baru
        [Template]    Pengaturan Unit Bisnis Tambah Department Baru
        # KODEDEPARTMENT          NAMADEPARTMENT          BATASHARGABARANG      BATASTRANSAKSI     TIPEPERSETUJUAN
        ${KODEDEPARTMENT}       ${NAMADEPARTMENT}         ${BATASHARGABARANG}  ${BATASTRANSAKSI}   ${TIPEPERSETUJUAN}
*** Keywords ***
Pengaturan Unit Bisnis Tambah Department Baru
        [Arguments]     ${KODEDEPARTMENT}       ${NAMADEPARTMENT}         ${BATASHARGABARANG}  ${BATASTRANSAKSI}   ${TIPEPERSETUJUAN}
        GIVEN Page Tambah Department Baru Opened
        WHEN Input All Field Click Button Simpan From Page Tambah Department Baru    ${KODEDEPARTMENT}       ${NAMADEPARTMENT}         ${BATASHARGABARANG}  ${BATASTRANSAKSI}   ${TIPEPERSETUJUAN}
        THEN Message Success will be displayed From Page Tambah Department Baru

Page Tambah Department Baru Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password
        Sub Menu Unit Bisnis Opened
        Click Button Tambah Department Baru From Daftar Department Page


Input All Field Click Button Simpan From Page Tambah Department Baru
        [Arguments]         ${KODEDEPARTMENT}       ${NAMADEPARTMENT}         ${BATASHARGABARANG}  ${BATASTRANSAKSI}   ${TIPEPERSETUJUAN}
        Input Department Code Text Field From Tambah Department Baru    ${KODEDEPARTMENT}
        Input Department Name From Tambah Department Baru    ${NAMADEPARTMENT}
        Input Batas Harga Barang Text Field From Tambah Department Baru     ${BATASHARGABARANG}
        Input Batas Transaksi Text Field From Tambah Department Baru    ${BATASTRANSAKSI}
        Input Tipe Persetujuan Drop List From Tambah Department Baru    ${TIPEPERSETUJUAN}
        Click Button Simpan From Tambah Department Baru

Message Success will be displayed From Page Tambah Department Baru
        Daftar Department Already Opened
        Close Window
