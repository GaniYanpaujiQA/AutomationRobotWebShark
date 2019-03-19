*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${LABEL_ANAKPERUSHAAN}                      //h3[@class='bt-typo-displaysmall bt-form-heading' and contains(text(),'Pengaturan Anak Perusahaan')]
${ANAKPERUSAHAAN_LIST}                  //a[@class='list-group-item __link']/div/div[@class='media-body']/div[@class='bt-typo-heading' and contains(text(),'PT_PERSERO Parent Child')]
${GANTIPERUSAHAAN_BUTTONLANJUT}         id=btnLanjut
# ${MENU_DETAILPERUSAHAAN}             //a[@class='list-group-item' and contains(text(),'Detail Perusahaan')]
# ${MENU_UNITBISNIS}                   //a[@class='list-group-item' and contains(text(),'Unit Bisnis')]
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***
Anak Perusahaan Already Opened
    Wait Until Element Is Visible    ${LABEL_ANAKPERUSHAAN}
    # Wait Until Element Is Visible    ${MENU_PENGATURANPERUSAHAANINDUK}
    # Wait Until Element Is Visible    ${MENU_DETAILPERUSAHAAN}
    # Wait Until Element Is Visible    ${MENU_UNITBISNIS}
    # Wait Until Element Is Visible    ${MENU_DAFTARPENGGUNA}
    # Wait Until Element Is Visible    ${MENU_ALAMAT}
    # Wait Until Element Is Visible    ${MENU_PENGATURANANAKPERUSAHAAN}
    # Wait Until Element Is Visible    ${MENU_AKUNSAYA}


Select Anak Perusahaan
    [Arguments]                 ${nama_anakPerusahaan}
    Anak Perusahaan Already Opened
    Wait Until Element Is Visible       //a[@class='list-group-item __link']/div/div[@class='media-body']/div[@class='bt-typo-heading' and contains(text(),'${nama_anakPerusahaan}')]
    Click Element                       //a[@class='list-group-item __link']/div/div[@class='media-body']/div[@class='bt-typo-heading' and contains(text(),'${nama_anakPerusahaan}')]


Pop Up Ganti Perusahaan Click Button Lanjut
    Wait Until Element Is Visible       ${GANTIPERUSAHAAN_BUTTONLANJUT}     timeout=30
    Click Element                       ${GANTIPERUSAHAAN_BUTTONLANJUT}
    Sleep    2
