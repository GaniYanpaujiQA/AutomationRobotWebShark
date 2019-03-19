*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${SEARCHFIELD_TEXTBOX}              id=search-department
${LIST_DEPARTMENT}                   //A[@class='list-group-item']
${ICON_SEARCH}                      //button[@class='btn btn-primary' and @type='submit']/span[@class='pt-icon-standard pt-icon-search']
${TAMBAHDEPARTMENTBARU_BUTTON}      //a[@class='btn btn-primary' and contains(text(),'Tambah Departemen Baru')]
${DETAILDEPARTMENT_BUTTON}      //a[@class='btn btn-primary' and contains(text(),'Tambah Departemen Baru')]
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
     [Arguments]             ${Search_data}
     Input Text             ${SEARCHFIELD_TEXTBOX}         ${Search_data}
     Click Element          ${ICON_SEARCH}


List Acoount Showed
    Wait Until Element Is Visible    ${LIST_DEPARTMENT}
    Click Element       ${LIST_DEPARTMENT}


Click Button Tambah Department Baru From Daftar Department Page
    Click Element       ${TAMBAHDEPARTMENTBARU_BUTTON}

Open Detail Department From Daftar Department Page
    Daftar Department Already Opened
    Click Element       ${LIST_DEPARTMENT}
