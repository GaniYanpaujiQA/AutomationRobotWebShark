*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${TAB_ANGGOTA}                      id=userTab
${SEARCH_TEXTBOX}                   name=search
${ICON_SEARCH}                      id=searchFilter
${LISTANGGOTA}                      //div[@class='list-group-item']
${TAMBAHANGGOTA_BUTTON}             //a[@class='btn btn-primary']
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***

Click Tab Anggota
      Sleep    2
      Wait Until Element Is Visible    ${TAB_ANGGOTA}
      Click Element                    ${TAB_ANGGOTA}
      Wait Until Element Is Visible    ${LISTANGGOTA}
      Wait Until Element Is Visible    ${SEARCH_TEXTBOX}
      Wait Until Element Is Visible    ${TAMBAHANGGOTA_BUTTON}




Input Text Search And Click Icon Search Field Tab Anggota
    [Arguments]            ${searchData}
     Input Text       ${SEARCH_TEXTBOX}         ${searchData}
     Click Element                    ${ICON_SEARCH}


Click Tambah Anggota Button
      Click Element                    ${TAMBAHANGGOTA_BUTTON}

Verify List Anggota
      [Arguments]         ${keterangan}
      Wait Until Element Is Visible    ${LISTANGGOTA}
      Element Text Should Be    //div[@class='list-group-item']/div/div[@class='media-body']/p[@class='list-group-item-text' and contains(text(),'Email ${keterangan}')]      Email ${keterangan}



List Anggota Based on Email Will Be Displayed
      [Arguments]         ${keterangan}
      Input Text Search And Click Icon Search Field Tab Anggota      ${keterangan}
      Wait Until Element Is Visible    ${LISTANGGOTA}
      Element Text Should Be    //div[@class='list-group-item']/div/div[@class='media-body']/p[@class='list-group-item-text' and contains(text(),'Email ${keterangan}')]      Email ${keterangan}
