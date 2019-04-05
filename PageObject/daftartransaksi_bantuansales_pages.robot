*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${SEARCH_TEXTBOX}                   //input[@id='search-transaction']
${DROPLIST_STATUS}                  //button[@data-id='ddlAssistedStatus']
${TEXTBOX_STATUS }                  //input[@type='text' and @class='form-control' and @aria-label='Search']
${CLICK_STATUS }                    //li[@class='active']/a[@tabindex='0']
${PICKLIST_JANGKAWAKTU}             //input[@class='form-control reportrange']
${STARDATE_TEXTBOX}                 //input[@name='daterangepicker_start']
${ENDDATE_TEXTBOX}                  //input[@name='daterangepicker_end']
${BUTTON_APPLY}                     //div[@class='calendar right']/div[@class='ranges']/div[@class='range_inputs']/button[@type='button' and contains(text(),'Apply')]
${ICON_SEARCH}                      //button[@class='btn' and @type='submit']/span[@class='pt-icon-standard pt-icon-search']
#${LIST_FIRST_BANTUANSALES}
${GET_REQ_NUMBER_LABEL}             //body[@id='bt-bisnis-brand']/div/div[3]/main/div[2]/div/div/div/div[3]/div/div/div/div/div/small
# xpath=(//div[@class='list-group bt-list-group bt-b2b__list list-transaction']/a[@class='list-group-item'])[1]
# ${MENU_DAFTARPENGGUNA}               //a[@class='list-group-item' and contains(text(),'Daftar Pengguna')]
# ${MENU_ALAMAT}                       //a[@class='list-group-item' and contains(text(),'Alamat')]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***

Klik Tab Bantuan Sales
      Sleep    3
      Execute JavaScript    window.scrollTo(400,0)
      Wait Until Element Is Visible    ${TAB_PESANANBERJALAN}
      Click Element                    ${TAB_PESANANBERJALAN}


Tab Bantuan Sales Already Opened
    Wait Until Element Is Visible    ${TAB_PESANANBERJALAN}
    Wait Until Element Is Visible    ${SEARCH_TEXTBOX}
    Wait Until Element Is Visible    ${DROPLIST_STATUS}
    Wait Until Element Is Visible    ${PICKLIST_JANGKAWAKTU}
    Wait Until Element Is Visible    ${ICON_SEARCH}


Input Text Search Field Tab Bantuan Sales
    [Arguments]            ${searchData}
    Input Text       ${SEARCH_TEXTBOX}         ${searchData}
    Click Element                    ${ICON_SEARCH}

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

Get Request Number Bantuan Sales Tab
      Execute JavaScript    window.scrollTo(400,0)
      Sleep    2
      ${request_number}        Get Text    ${GET_REQ_NUMBER_LABEL}
      Set Global Variable    ${request_number}       ${request_number}
      Log To Console    ${request_number}
      Wait Until Element Is Visible    ${GET_REQ_NUMBER_LABEL}           timeout=20

