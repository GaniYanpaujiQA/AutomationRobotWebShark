*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${INPUTOPTYSEARCH_TEXTBOX}          name=search
${ICONOPTYSEARCH_TEXTBOX}           //span[@class='input-group-btn']/button[@type='submit']
${SEARCHRESULT_LIST}                //div[@class='react-bs-container-body']/table/tbody/tr/td/a[contains(text(),'O190000589')]
${SELECTEMAIL_DROPDOWN}             //span[@class='dropdown-heading-value']/span[contains(text(),'1 Selected')]
#//span[@class='dropdown-heading-dropdown-arrow']
${SELECTEMAIL_TEXTBOX}              //div[@class='dropdown-content']/div[@class='select-panel']/div/input[@type='text' and @placeholder='Search']
${SELECTALL_DROPBOX}                //span[@class='item-renderer']/input[@type='checkbox']
${QUOTATIONS_TAB}                   id=tabOpportunityDetail-tab-quotation
${QUOTATIONS_TABLE}                 //div/div[@class='react-bs-container-body']/table[@class='table table-striped table-bordered table-hover']/tbody/tr/td[@tabindex='1']/a
${opty_num}                          O190000623

${LABEL_OPTY}                       //h1[contains(text(),'Opportunities')]
*** Keywords ***
Opportunities Page Opened
      Sleep    4
      Wait Until Page Contains Element    ${SELECTEMAIL_DROPDOWN}
      Wait Until Element Is Visible     ${ICONOPTYSEARCH_TEXTBOX}       timeout=60
      Wait Until Element Is Visible     ${SELECTEMAIL_DROPDOWN}         timeout=60

Search Data From Opportunities
     [Arguments]                ${opty_number}
     Wait Until Page Contains Element    ${INPUTOPTYSEARCH_TEXTBOX}
     Wait Until Element Is Visible     ${INPUTOPTYSEARCH_TEXTBOX}       timeout=15
     Click Element        ${INPUTOPTYSEARCH_TEXTBOX}
     Input Text           ${INPUTOPTYSEARCH_TEXTBOX}           ${opty_number}
     Click Element        ${ICONOPTYSEARCH_TEXTBOX}
     Sleep    2


Open Search Data From Opportunities Already Showed
    [Arguments]                ${opty_number}
    Wait Until Element Is Visible     //div[@class='react-bs-container-body']/table/tbody/tr/td/a[contains(text(),${opty_number} )]
    Click Element                     //div[@class='react-bs-container-body']/table/tbody/tr/td/a[contains(text(),${opty_number})]


Select All Email From Dropdown
    [Arguments]       ${selectAll}
    Wait Until Element Is Visible     ${SELECTEMAIL_DROPDOWN}       timeout=40
    Click Element     ${SELECTEMAIL_DROPDOWN}
    Input Text        ${SELECTEMAIL_TEXTBOX}     ${selectAll}
    Select Checkbox    ${SELECTALL_DROPBOX}
    Sleep    3
    Wait Until Element Is Visible                ${LABEL_OPTY}       timeout=40
    Wait Until Element Is Enabled            ${LABEL_OPTY}       timeout=40
    Click Element      ${LABEL_OPTY}


Open Tab Quotations
    Sleep    3
    Wait Until Element Is Visible     ${QUOTATIONS_TAB}
    Click Element                     ${QUOTATIONS_TAB}


Click Data From List Quotations
    Sleep    2
    Wait Until Element Is Visible     ${QUOTATIONS_TABLE}       timeout=20
    Click Element                     ${QUOTATIONS_TABLE}

Open Quotation Pages From Opportunities
     [Arguments]             ${opty_number}        ${selectAll}
     Opportunities Page Opened
     Log To Console    ${opty_number}
     Select All Email From Dropdown     ${selectAll}
     Search Data From Opportunities     ${opty_number}
     Open Search Data From Opportunities Already Showed     ${opty_number}
     Open Tab Quotations
     Click Data From List Quotations
