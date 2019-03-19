*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/pengaturan/pengaturan_detailAkun_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${PATHIMAGE}          //Users//ganiyanpauji//Downloads//Account\ Shipping\ Address\ Fields\ v2.png
${JENISBADANUSAHA}    CV
${NAMAORGANISASI}     Nama Organisasi
${JUMLAHKARYAWAN}     51-100
${TAHUNBERDIRI}       2001
${REPORTMESSAGE}    Success update account
*** Test Cases ***
Open Detail Akun
      [Template]  Pengaturan Detail Akun
      #PathImage      jenisBadanUsaha       NamaOrganisasi      jumlahKaryawan      tahunBerdiri        Message
      ${PATHIMAGE}    ${JENISBADANUSAHA}    ${NAMAORGANISASI}   ${JUMLAHKARYAWAN}  ${TAHUNBERDIRI}      ${REPORTMESSAGE}
*** Keywords ***
Pengaturan Detail Akun
        [Arguments]       ${PATHIMAGE}    ${JENISBADANUSAHA}    ${NAMAORGANISASI}   ${JUMLAHKARYAWAN}  ${TAHUNBERDIRI}      ${REPORTMESSAGE}
        GIVEN Page Pengaturan Detail Akun Opened
        WHEN Input All Field Click Button Simpan          ${PATHIMAGE}    ${JENISBADANUSAHA}    ${NAMAORGANISASI}   ${JUMLAHKARYAWAN}  ${TAHUNBERDIRI}
        THEN Message Success will be displayed            ${REPORTMESSAGE}

 Page Pengaturan Detail Akun Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password
        Menu Profil Already Opened
        Click Button Menu Pengaturan
        Click Button Menu Pengaturan Submenu Detail Perusahaan
        Detail Akun Already Open

Input All Field Click Button Simpan
        [Arguments]           ${PATHIMAGE}    ${JENISBADANUSAHA}    ${NAMAORGANISASI}   ${JUMLAHKARYAWAN}  ${TAHUNBERDIRI}
        Upload Image     ${PATHIMAGE}
        Select Jenis Badan Usaha Droplist    ${JENISBADANUSAHA}
        Input Nama Organisasi Text Box       ${NAMAORGANISASI}
        Select Jumlah Karyawan Droplist      ${JUMLAHKARYAWAN}
        Select Tahun Berdiri Droplist        ${TAHUNBERDIRI}
        Click Button Simpan

Message Success will be displayed
        [Arguments]             ${REPORTMESSAGE}
        Message Success Update Account      ${REPORTMESSAGE}
        Close Window
