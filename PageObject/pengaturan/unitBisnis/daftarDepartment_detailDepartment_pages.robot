*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${KODEDEPARTMENT_TEXTBOX}              name=kodeDepartemen
${NAMADEPARTMENT_TEXTBOX}              id=namaDepartemen
${BATASHARGABARANG_TEXTBOX}            id=batasHarga
${BATASTRANSAKSI_TEXTBOX}              id=batasTransaksi
${TIPEPERSETUJUAN_DROPLIST}            id=approvalType
${SIMPAN_BUTTON}                       id=saveBtn
${MESSAGE_SUCCESS}                     //div[@id='idGlobalMessage']/div[@class='alert alert-success']
${PERUBAHANTINGKATAPPROVAL_BUTTON}     id=btnSubmit

# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***

Edit Department Already Opened
      Sleep    2
      Wait Until Element Is Visible    ${KODEDEPARTMENT_TEXTBOX}
      Wait Until Element Is Visible    ${NAMADEPARTMENT_TEXTBOX}
      Wait Until Element Is Visible    ${BATASHARGABARANG_TEXTBOX}
      Wait Until Element Is Visible    ${BATASTRANSAKSI_TEXTBOX}
      Wait Until Element Is Visible    ${TIPEPERSETUJUAN_DROPLIST}
      Wait Until Element Is Visible    ${SIMPAN_BUTTON}



Input Department Code Text Field From Edit Department
     [Arguments]             ${codeDepartment}
     Input Text             ${KODEDEPARTMENT_TEXTBOX}          ${codeDepartment}


Input Department Name From Edit Department
     [Arguments]             ${namaDepartment}
     Input Text             ${NAMADEPARTMENT_TEXTBOX}         ${namaDepartment}

Input Batas Harga Barang Text Field From Edit Department
      [Arguments]             ${batasHargaBarang}
      Input Text             ${BATASHARGABARANG_TEXTBOX}         ${batasHargaBarang}

Input Batas Transaksi Text Field From Edit Department
      [Arguments]             ${batasTransaksi}
      Input Text             ${BATASTRANSAKSI_TEXTBOX}         ${batasTransaksi}

Input Tipe Persetujuan Drop List From Edit Department
      [Arguments]             ${tipePersetujuan}
      Select From List By Label                ${TIPEPERSETUJUAN_DROPLIST}        ${tipePersetujuan}

Click Button Simpan From Edit Department
      Click Element                 ${SIMPAN_BUTTON}

Click Button Lanjut From Pop Up Perubahaan Tingkat Approval On Edit Department Page
     Wait Until Element Is Visible      ${PERUBAHANTINGKATAPPROVAL_BUTTON}
     Click Element                 ${PERUBAHANTINGKATAPPROVAL_BUTTON}

Message Success From Edit Department
        Wait Until Element Is Visible      ${MESSAGE_SUCCESS}
        Element Text Should Be    ${MESSAGE_SUCCESS}     Success update department
