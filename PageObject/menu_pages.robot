*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${MENU_INBOX}                      //a[@class='list-group-item active' and contains(text(),'Inbox')]
${MENU_TRANSAKSI}                  //a[@class='list-group-item ' and contains(text(),'Transaksi')]
${MENU_LAPORAN}                    //a[@class='list-group-item ' and contains(text(),'Laporan')]
${MENU_PENGATURAN}                    //a[@class='list-group-item collapsed' and contains(text(),'Pengaturan')]
${SUBMENU_PENGATURAN_DETAILPERUSAHAAN}   //a[@class='list-group-item ' and contains(text(),'Detail Perusahaan')]
${SUBMENU_PENGATURAN_UNITBISNIS}         //a[@class='list-group-item ' and contains(text(),'Unit Bisnis')]
${MENU_PENGATURANPERUSAHAANINDUK}             //a[@class='list-group-item ' and contains(text(),'Pengaturan Perusahaan Induk')]
# ${MENU_DETAILPERUSAHAAN}             //a[@class='list-group-item' and contains(text(),'Detail Perusahaan')]
# ${MENU_UNITBISNIS}                   //a[@class='list-group-item' and contains(text(),'Unit Bisnis')]
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item ' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***
Menu Profil Already Opened
    Wait Until Element Is Visible    ${MENU_INBOX}
    Wait Until Element Is Visible    ${MENU_LAPORAN}
    Wait Until Element Is Visible    ${MENU_PENGATURAN}
    # Wait Until Element Is Visible    ${MENU_PENGATURANPERUSAHAANINDUK}
    # Wait Until Element Is Visible    ${MENU_DETAILPERUSAHAAN}
    # Wait Until Element Is Visible    ${MENU_UNITBISNIS}
    # Wait Until Element Is Visible    ${MENU_DAFTARPENGGUNA}
    # Wait Until Element Is Visible    ${MENU_ALAMAT}
    # Wait Until Element Is Visible    ${MENU_PENGATURANANAKPERUSAHAAN}
    # Wait Until Element Is Visible    ${MENU_AKUNSAYA}

Klik Button Menu Inbox
    Click Element                    ${MENU_INBOX}

Click Button Menu Transaksi
    # Menu Profil Already Opened
    Wait Until Element Is Visible         ${MENU_TRANSAKSI}
    Click Element                ${MENU_TRANSAKSI}

Click Button Menu Perusahaan Induk
    # Menu Perusahan Induk Already Opened
    Wait Until Element Is Visible          ${MENU_PENGATURANPERUSAHAANINDUK}
    Click Element                ${MENU_PENGATURANPERUSAHAANINDUK}

Click Button Menu Pengaturan Anak Perusahaan
    # Menu Anak Perusahaan Already Opened
    Wait Until Element Is Visible          ${MENU_PENGATURANANAKPERUSAHAAN}
    Click Element                ${MENU_PENGATURANANAKPERUSAHAAN}

Klik Button Menu Laporan
    Click Element                ${MENU_LAPORAN}

Click Button Menu Pengaturan
    Click Element                    ${MENU_PENGATURAN}
    Sleep    2
    Wait Until Element Is Visible    ${SUBMENU_PENGATURAN_DETAILPERUSAHAAN}
    Wait Until Element Is Visible    ${SUBMENU_PENGATURAN_UNITBISNIS}

Click Button Menu Pengaturan Submenu Detail Perusahaan
    Click Element    ${SUBMENU_PENGATURAN_DETAILPERUSAHAAN}

Sub Menu Unit Bisnis Opened
    Menu Profil Already Opened
    Click Button Menu Pengaturan
    Click Element    ${SUBMENU_PENGATURAN_UNITBISNIS}
