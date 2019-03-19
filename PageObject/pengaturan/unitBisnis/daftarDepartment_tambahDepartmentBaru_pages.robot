*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${KODEDEPARTMENT_TEXTBOX}              name=kodeDepartemen
${NAMADEPARTMENT_TEXTBOX}              id=namaDepartemen
${BATASHARGABARANG_TEXTBOX}            id=batasHarga
${BATASTRANSAKSI_TEXTBOX}              id=batasTransaksi
${TIPEPERSETUJUAN_DROPLIST}            id=tipePersetujuan
${SIMPAN_BUTTON}                       //button[@type='submit' and contains(text(),'Simpan')]
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***

Tambah Department Baru Already Opened
      Sleep    2
      Wait Until Element Is Visible    ${KODEDEPARTMENT_TEXTBOX}
      Wait Until Element Is Visible    ${NAMADEPARTMENT_TEXTBOX}
      Wait Until Element Is Visible    ${BATASHARGABARANG_TEXTBOX}
      Wait Until Element Is Visible    ${BATASTRANSAKSI_TEXTBOX}
      Wait Until Element Is Visible    ${TIPEPERSETUJUAN_DROPLIST}
      Wait Until Element Is Visible    ${SIMPAN_BUTTON}



Input Department Code Text Field From Tambah Department Baru
     [Arguments]             ${codeDepartment}
     Input Text             ${KODEDEPARTMENT_TEXTBOX}          ${codeDepartment}


Input Department Name From Tambah Department Baru
     [Arguments]             ${namaDepartment}
     Input Text             ${NAMADEPARTMENT_TEXTBOX}         ${namaDepartment}

Input Batas Harga Barang Text Field From Tambah Department Baru
      [Arguments]             ${batasHargaBarang}
      Input Text             ${BATASHARGABARANG_TEXTBOX}         ${batasHargaBarang}

Input Batas Transaksi Text Field From Tambah Department Baru
      [Arguments]             ${batasTransaksi}
      Input Text             ${BATASTRANSAKSI_TEXTBOX}         ${batasTransaksi}

Input Tipe Persetujuan Drop List From Tambah Department Baru
      [Arguments]             ${tipePersetujuan}
      Select From List By Label                ${TIPEPERSETUJUAN_DROPLIST}        ${tipePersetujuan}

Click Button Simpan From Tambah Department Baru
      Click Element                 ${SIMPAN_BUTTON}
