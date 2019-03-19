*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${TAB_HISTORIBUDGET}                id=historiBudgetTab
${PENAMBAHAN_TEXTBOX}               id=penambahan
${KETERANGAN_TEXTBOX}               id=keterangan
${SESUAIKANBUDGET_BUTTON}           //button[@class='btn btn-primary pull-right']
${LANJUT_BUTTON}                    id=btnSubmitBudget


${PICKLIST_JANGKAWAKTU}             id=dateFilter
${STARDATE_TEXTBOX}                 //input[@name='daterangepicker_start']
${ENDDATE_TEXTBOX}                  //input[@name='daterangepicker_end']
${BUTTON_APPLY}                     //div[@class='calendar right']/div[@class='ranges']/div[@class='range_inputs']/button[@type='button' and contains(text(),'Apply')]
${ICON_SEARCHHISTORYBUDGET}         id=searchFilter
${LISTHISTORYBUDGET}                //div[@class='list-group-item']
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***


Page Ubah Budgets Already Opened
     Wait Until Element Is Visible    ${PENAMBAHAN_TEXTBOX}
     Wait Until Element Is Visible    ${KETERANGAN_TEXTBOX}
     Wait Until Element Is Visible    ${SESUAIKANBUDGET_BUTTON}


Input Text Penambahan Field Tab Ubah Budgets
     [Arguments]      ${penambahanHarga}
     Input Text       ${PENAMBAHAN_TEXTBOX}         ${penambahanHarga}

Input Text Keterangan Field Tab Ubah Budgets
     [Arguments]      ${keterangan}
     Input Text       ${KETERANGAN_TEXTBOX}         ${keterangan}

Click Button Sesuaikan Budget
      Click Element                    ${SESUAIKANBUDGET_BUTTON}

Click Button Lanjut From Pop Up Penyesuaian Budget
      Wait Until Element Is Visible    ${LANJUT_BUTTON}
      Click Element                    ${LANJUT_BUTTON}
