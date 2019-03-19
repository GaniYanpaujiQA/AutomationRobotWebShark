*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${LABEL_INBOX}                      //h3[@class='bt-typo-displaysmall bt-form-heading' and contains(text(),'Inbox')]
${MESSAGE1}                         //div[@id='heading1']
# ${MENU_TRANSAKSI}                  //a[@class='list-group-item' and contains(text(),'Transaksi')]
# ${MENU_LAPORAN}                    //a[@class='list-group-item' and contains(text(),'Laporan')]
# ${MENU_PENGATURANPERUSAHAANINDUK}             //a[@class='list-group-item' and contains(text(),'Pengaturan Perusahaan Induk')]
# ${MENU_DETAILPERUSAHAAN}             //a[@class='list-group-item' and contains(text(),'Detail Perusahaan')]
# ${MENU_UNITBISNIS}                   //a[@class='list-group-item' and contains(text(),'Unit Bisnis')]
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***
Menu Inbox Already Opened
    Wait Until Element Is Visible    ${LABEL_INBOX}
    Wait Until Element Is Visible    ${MESSAGE1}

Klik Message 1
     Click Element                    ${MESSAGE1}
