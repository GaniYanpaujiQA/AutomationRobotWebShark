*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${UPLOAD_IMAGE}                      name=uploadFile
${DROPLIST_BADANUSAHA}               id=jenisBadanUsaha
${TEXTBOX_NAMAORGANISASI}            id=namaOrganisasi
${DROPLIST_JUMLAHKARYAWAN}           id=jumlahKaryawan
${DROPLIST_TAHUNBERDIRI}             id=tahunBerdiri
${BUTTON_SIMPAN}                     //button[@type='submit' and contains(text(),'Simpan')]
${MESSAGE_SUCCESS}                  //div[@id='respon_server_message']



# ${MENU_PENGATURANPERUSAHAANINDUK}             //a[@class='list-group-item' and contains(text(),'Pengaturan Perusahaan Induk')]
# ${MENU_DETAILPERUSAHAAN}             //a[@class='list-group-item' and contains(text(),'Detail Perusahaan')]
# ${MENU_UNITBISNIS}                   //a[@class='list-group-item' and contains(text(),'Unit Bisnis')]
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***
Detail Akun Already Open
    Sleep    2
    Wait Until Element Is Visible    ${DROPLIST_BADANUSAHA}
    Wait Until Element Is Visible    ${TEXTBOX_NAMAORGANISASI}
    Wait Until Element Is Visible    ${DROPLIST_TAHUNBERDIRI}
    Wait Until Element Is Visible    ${DROPLIST_JUMLAHKARYAWAN}
    Wait Until Element Is Visible    ${BUTTON_SIMPAN}


    # Wait Until Element Is Visible    ${MENU_PENGATURANPERUSAHAANINDUK}
    # Wait Until Element Is Visible    ${MENU_DETAILPERUSAHAAN}
    # Wait Until Element Is Visible    ${MENU_UNITBISNIS}
    # Wait Until Element Is Visible    ${MENU_DAFTARPENGGUNA}
    # Wait Until Element Is Visible    ${MENU_ALAMAT}
    # Wait Until Element Is Visible    ${MENU_PENGATURANANAKPERUSAHAAN}
    # Wait Until Element Is Visible    ${MENU_AKUNSAYA}

Upload Image
    [Arguments]         ${pathImage}
    Choose File    ${UPLOAD_IMAGE}    //Users//ganiyanpauji//Downloads//Account\ Shipping\ Address\ Fields\ v2.png


Select Jenis Badan Usaha Droplist
    [Arguments]             ${badanUsaha}
    Select From List By Label       ${DROPLIST_BADANUSAHA}    ${badanUsaha}

Input Nama Organisasi Text Box
    [Arguments]             ${namaOrganisasi}
    Input Text    ${TEXTBOX_NAMAORGANISASI}    ${namaOrganisasi}


Select Jumlah Karyawan Droplist
    [Arguments]             ${jumlahKaryawan}
    Click Element                  ${DROPLIST_JUMLAHKARYAWAN}
    Select From List By Label             ${DROPLIST_JUMLAHKARYAWAN}        ${jumlahKaryawan}

Select Tahun Berdiri Droplist
    [Arguments]             ${tahunBerdiri}
    Sleep     3
    Click Element         ${DROPLIST_TAHUNBERDIRI}
    Input Text        ${DROPLIST_TAHUNBERDIRI}       ${tahunBerdiri}

Click Button Simpan
    Click Element            ${BUTTON_SIMPAN}


Message Success Update Account
    [Arguments]         ${reportMessage}
    Wait Until Element Is Visible     ${MESSAGE_SUCCESS}
    Element Text Should Be    ${MESSAGE_SUCCESS}      ${reportMessage}
