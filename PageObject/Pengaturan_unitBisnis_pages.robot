*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${SEARCHFIELD_TEXTBOX}                 id=search-department
${LIST_DEPARTMENT}                     //A[@class='list-group-item']
${ICON_SEARCH}                         //button[@class='btn btn-primary' and @type='submit']/span[@class='pt-icon-standard pt-icon-search']
${TAMBAHDEPARTMENTBARU_BUTTON}         //a[@class='btn btn-primary' and contains(text(),'Tambah Departemen Baru')]
${DETAILDEPARTMENT_BUTTON}             //a[@class='btn btn-primary' and contains(text(),'Tambah Departemen Baru')]

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

Daftar Department Already Opened
      Sleep    2
      Wait Until Element Is Visible    ${SEARCHFIELD_TEXTBOX}
      Wait Until Element Is Visible    ${ICON_SEARCH}
      Wait Until Element Is Visible    ${TAMBAHDEPARTMENTBARU_BUTTON}



Input Text For Use Field Search
     [Arguments]            ${Search_data}
     Input Text             ${SEARCHFIELD_TEXTBOX}         ${Search_data}
     Click Element          ${ICON_SEARCH}


List Acoount Showed
    Wait Until Element Is Visible    ${LIST_DEPARTMENT}
    Click Element       ${LIST_DEPARTMENT}


Click Button Tambah Department Baru From Daftar Department Page
    Click Element       ${TAMBAHDEPARTMENTBARU_BUTTON}

Open Detail Department From Daftar Department Page
    Click Element       ${LIST_DEPARTMENT}


# Detail Department
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
         Input Text              ${KODEDEPARTMENT_TEXTBOX}          ${codeDepartment}

Input Department Name From Edit Department
         [Arguments]             ${namaDepartment}
         Input Text              ${NAMADEPARTMENT_TEXTBOX}          ${namaDepartment}

Input Batas Harga Barang Text Field From Edit Department
          [Arguments]             ${batasHargaBarang}
          Input Text              ${BATASHARGABARANG_TEXTBOX}        ${batasHargaBarang}

Input Batas Transaksi Text Field From Edit Department
          [Arguments]             ${batasTransaksi}
          Input Text              ${BATASTRANSAKSI_TEXTBOX}          ${batasTransaksi}

Input Tipe Persetujuan Drop List From Edit Department
          [Arguments]             ${tipePersetujuan}
          Select From List By Label                ${TIPEPERSETUJUAN_DROPLIST}        ${tipePersetujuan}

Click Button Simpan From Edit Department
          Click Element           ${SIMPAN_BUTTON}

Click Button Lanjut From Pop Up Perubahaan Tingkat Approval On Edit Department Page
         Wait Until Element Is Visible         ${PERUBAHANTINGKATAPPROVAL_BUTTON}
         Click Element                         ${PERUBAHANTINGKATAPPROVAL_BUTTON}

Message Success From Edit Department
            Wait Until Element Is Visible      ${MESSAGE_SUCCESS}
            Element Text Should Be             ${MESSAGE_SUCCESS}      Success update department
