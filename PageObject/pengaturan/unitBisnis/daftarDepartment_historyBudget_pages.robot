*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${TAB_HISTORIBUDGET}                id=historiBudgetTab
${SEARCH_TEXTBOX}                   name=search
${PICKLIST_JANGKAWAKTU}             id=dateFilter
${STARDATE_TEXTBOX}                 //input[@name='daterangepicker_start']
${ENDDATE_TEXTBOX}                  //input[@name='daterangepicker_end']
${BUTTON_APPLY}                     //div[@class='calendar right']/div[@class='ranges']/div[@class='range_inputs']/button[@type='button' and contains(text(),'Apply')]
${ICON_SEARCHHISTORYBUDGET}         id=searchFilter
${LISTHISTORYBUDGET}                //div[@class='list-group-item']
${UBAHBUDGET_BUTTON}                //a[@class='btn btn-default']
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***

Click Tab Histori Budgets
      Sleep    2
      Wait Until Element Is Visible    ${TAB_HISTORIBUDGET}
      Click Element                    ${TAB_HISTORIBUDGET}
      Wait Until Element Is Visible    ${LISTHISTORYBUDGET}


Tab Histori Budgets Already Opened
    Wait Until Element Is Visible    ${SEARCH_TEXTBOX}
    Wait Until Element Is Visible    ${PICKLIST_JANGKAWAKTU}


Input Text Search Field Tab Histori Budgets
    [Arguments]            ${searchData}
     Input Text       ${SEARCH_TEXTBOX}         ${searchData}
     Click Element                    ${ICON_SEARCHHISTORYBUDGET}

Select Droplist Status Tab Bantuan Sales
      [Arguments]            ${status}
      Click Element                    ${DROPLIST_STATUS}
      Wait Until Element Is Visible    ${TEXTBOX_STATUS}
      Click Element      ${TEXTBOX_STATUS}
      Input Text         ${TEXTBOX_STATUS}         ${status}
      Sleep    2
      Click Element           ${CLICK_STATUS}

Select Star and End Date Tab Bantuan Sales
      [Arguments]             ${startDate}    ${endDate}
      Click Element                    ${PICKLIST_JANGKAWAKTU}
      Wait Until Element Is Visible    ${STARDATE_TEXTBOX}
      Wait Until Element Is Visible    ${ENDDATE_TEXTBOX}
      Execute JavaScript    window.scrollTo(0,400)
      Wait Until Element Is Visible    ${BUTTON_APPLY}
      Click Element      ${STARDATE_TEXTBOX}
      Input Text         ${STARDATE_TEXTBOX}         ${startDate}
      Click Element      ${ENDDATE_TEXTBOX}
      Input Text         ${ENDDATE_TEXTBOX}         ${endDate}
      Sleep    2
      Click Element      ${BUTTON_APPLY}

Report List Histori Budget
      Wait Until Element Is Visible    ${LISTHISTORYBUDGET}

Click Ubah Budget Button
      Click Element                    ${UBAHBUDGET_BUTTON}

History Budget By Keterangan Ubah Budget
      [Arguments]         ${keterangan}
      Input Text Search Field Tab Histori Budgets      ${keterangan}
      Wait Until Element Is Visible    ${LISTHISTORYBUDGET}
      Element Text Should Be    //div[@class='list-group-item']/dl/dt[@class='list-group-item-heading' and contains(text(),'${keterangan}')]      ${keterangan}
