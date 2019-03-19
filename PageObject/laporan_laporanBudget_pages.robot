*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${TAB_LAPORANBUDGET}                //a[@href='http://shark-cf-staging.bhinnekalocal.com/account/report/budget']
${TEXTBOX_DEPARTMENT }              //div[@role='combobox']/div[@class='bs-searchbox']/input[@type='text' and @class='form-control' and @aria-label='Search']
${PICKLIST_JANGKAWAKTU}             //input[@class='form-control reportrange']
${STARDATE_TEXTBOX}                 //input[@name='daterangepicker_start']
${ENDDATE_TEXTBOX}                  //input[@name='daterangepicker_end']
${BUTTON_APPLY}                     //div[@class='calendar right']/div[@class='ranges']/div[@class='range_inputs']/button[@type='button' and contains(text(),'Apply')]
${DROPLIST_DEPARTMENT}              //button[@data-id='ddlDepartment' and @type='button']
${LIST_LAPORAN}                     //div[@class='list-group-item text-center']
${SELECT_DROPLIST}                  id=ddlDepartment
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]

*** Keywords ***

Klik Tab Laporan Budget
      Sleep    2
      Wait Until Element Is Visible    ${TAB_LAPORANBUDGET}
      Click Element                    ${TAB_LAPORANBUDGET}


Tab Laporan Budget Already Opened
    Wait Until Element Is Visible    ${PICKLIST_JANGKAWAKTU}
    Wait Until Element Is Visible    ${DROPLIST_DEPARTMENT}




Select Star and End Date Tab Laporan Budget
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

Select Droplist Department Tab Laporan Budget
      [Arguments]         ${department}
      Select From List By Label     ${SELECT_DROPLIST}                ${department}
      Sleep    3
      # Wait Until Element Is Visible    ${TEXTBOX_DEPARTMENT}
      # Click Element      ${TEXTBOX_DEPARTMENT}
      # Input Text         ${TEXTBOX_DEPARTMENT}         ${department}
      # Sleep    2
      # Click Element      ${CLICK_STATUS}

Report List
    Wait Until Element Is Visible    ${LIST_LAPORAN}
