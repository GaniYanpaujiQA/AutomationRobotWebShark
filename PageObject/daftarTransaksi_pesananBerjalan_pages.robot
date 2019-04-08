*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${TAB_PESANANBERJALAN}              //a[@href='http://shark-cf-staging.bhinnekalocal.com/account/transaction/myOrder']
${SEARCH_TEXTBOX}                   //input[@id='search-transaction']
${DROPLIST_STATUS}                  //button[@data-id='ddlOptyStatus']
${TEXTBOX_STATUS }                  //input[@type='text' and @class='form-control' and @aria-label='Search']
${CLICK_STATUS }                    //li[@class='active']/a[@tabindex='0']
${PICKLIST_JANGKAWAKTU}             //input[@class='form-control reportrange']
${STARDATE_TEXTBOX}                 //input[@name='daterangepicker_start']
${ENDDATE_TEXTBOX}                  //input[@name='daterangepicker_end']
${BUTTON_APPLY}                     //div[@class='calendar right']/div[@class='ranges']/div[@class='range_inputs']/button[@type='button' and contains(text(),'Apply')]
${ICON_SEARCH}                      //button[@class='btn' and @type='submit']/span[@class='pt-icon-standard pt-icon-search']
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***

Klik Tab Pesanan Berjalan
      Sleep    2
      Click Element                    ${TAB_PESANANBERJALAN}


Tab Pesanan berjalan Already Opened
    Wait Until Element Is Visible    ${TAB_PESANANBERJALAN}
    Wait Until Element Is Visible    ${SEARCH_TEXTBOX}
    Wait Until Element Is Visible    ${DROPLIST_STATUS}
    Wait Until Element Is Visible    ${PICKLIST_JANGKAWAKTU}
    Wait Until Element Is Visible    ${ICON_SEARCH}


Input Text Search Field
    [Arguments]            ${SKU_NUMBER}
     Input Text       ${SEARCH_TEXTBOX}         ${SKU_NUMBER}
     Click Element                    ${ICON_SEARCH}

Select Droplist Status
      [Arguments]            ${status}
      Click Element                    ${DROPLIST_STATUS}
      Wait Until Element Is Visible    ${TEXTBOX_STATUS}
      Click Element      ${TEXTBOX_STATUS}
      Input Text         ${TEXTBOX_STATUS}         ${status}
      Sleep    2
      Click Element           ${CLICK_STATUS}

Select Star and End Date
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
