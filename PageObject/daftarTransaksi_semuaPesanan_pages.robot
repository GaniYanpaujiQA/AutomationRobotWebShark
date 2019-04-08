*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${SEARCH_TEXTBOX}                   //input[@id='search-transaction' and @name='search']
${DROPLIST_STATUS}                  //button[@data-id='ddlOptyStatus']
${TEXTBOX_STATUS }                  //input[@type='text' and @class='form-control' and @aria-label='Search']
${TEXTBOX_DEPARTMENT }              xpath=(.//*[normalize-space(text()) and normalize-space(.)='Departemen'])[1]/following::input[1]
${CLICK_STATUS }                    //li[@class='active']/a[@tabindex='0']
${PICKLIST_JANGKAWAKTU}             //input[@class='form-control reportrange']
${STARDATE_TEXTBOX}                 //input[@name='daterangepicker_start']
${ENDDATE_TEXTBOX}                  //input[@name='daterangepicker_end']
${BUTTON_APPLY}                     //div[@class='calendar right']/div[@class='ranges']/div[@class='range_inputs']/button[@type='button' and contains(text(),'Apply')]
${ICON_SEARCH}                      //button[@class='btn' and @type='submit']/span[@class='pt-icon-standard pt-icon-search']
${ICON_SEARCHANAKPERUSAHAAN}        xpath=(//div[@class='group-search']/button[@class='btn' and @type='submit']/span[@class='pt-icon-standard pt-icon-search'])
${DROPLIST_DEPARTMENT}               //button[@data-id='departement' and @type='button']
${DROPLIST_BANTUANSALES}             //button[@data-id='filter_assisted' and @type='button']
${LIST_BANTUANSALES}                  id=filter_assisted
${LIST_FIRST}                        xpath=(//div/div[@class='list-group bt-list-group bt-b2b__list list-transaction']/a[@class='list-group-item'])[1]
# ${MENU_PENGATURANANAKPERUSAHAAN}     //a[@class='list-group-item' and contains(text(),'Pengaturan Anak Perusahaan')]
# ${MENU_AKUNSAYA}                     //a[@class='list-group-item' and contains(text(),'Akun Saya')]
${NAMAOPTY_LABEL}                             //a/div[@class='list-group-item-heading']/div[@class='list-heading-text']/h4[@class='bt-typo-displaysmall']
${BELIDENGANBANTUAN_BUTTON}           id=btnAssistBuy
${OPTYNUMBER}
   # Pembelian dengan bantuan Sales
${NAMAORDER_TEXTFIELD}               id=orderName
${PESANUNTUKSALES_TEXTFIELD}         id=orderNote
${SUBMIT_BUTTON_ASSIS}                     id=btnAssistSubmit
    # Pop Up Permintaan bantuan diproses
${KEMBALIKEDASHBOARD_BUTTON}        //button[@class='btn btn-default' and contains(text(),'Kembali Ke Dashboard')]

${SELECT_DEPARTMENT_DROPLIST}       id=departmentId
*** Keywords ***

Klik Tab Semua Pesanan
      Wait Until Element Is Visible         ${TAB_SEMUAPESANAN}            timeout=15
      Click Element                         ${TAB_SEMUAPESANAN}


Tab Semua Pesanan Already Opened
    Wait Until Element Is Visible    ${TAB_SEMUAPESANAN}
    Wait Until Element Is Visible    ${SEARCH_TEXTBOX}
    Wait Until Element Is Visible    ${DROPLIST_STATUS}
    Wait Until Element Is Visible    ${PICKLIST_JANGKAWAKTU}
    Wait Until Element Is Visible    ${ICON_SEARCH}


Input Text Search Field Tab Semua Pesanan
    [Arguments]            ${SKU_NUMBER}
    Wait Until Element Is Visible         ${SEARCH_TEXTBOX}
    Input Text             ${SEARCH_TEXTBOX}         ${SKU_NUMBER}
    Wait Until Element Is Visible         ${ICON_SEARCH}
    Click Element                    ${ICON_SEARCH}

Input Text Search Field Tab Semua Pesanan For Anak Perusahaan
    [Arguments]            ${SKU_NUMBER}
    Execute JavaScript    window.scrollTo(0,700)
    Wait Until Element Is Visible         ${SEARCH_TEXTBOX}
    Input Text       ${SEARCH_TEXTBOX}         ${SKU_NUMBER}
    Wait Until Element Is Visible         ${ICON_SEARCHANAKPERUSAHAAN}
    Log To Console     Icon Detected
    # clickProblem        ${ICON_SEARCH}
    Log To Console     Icon Detected from python
    Click Element              ${ICON_SEARCHANAKPERUSAHAAN}


Select Droplist Status Tab Semua Pesanan
      [Arguments]            ${status}
      Click Element                    ${DROPLIST_STATUS}
      Wait Until Element Is Visible    ${TEXTBOX_STATUS}
      Click Element      ${TEXTBOX_STATUS}
      Input Text         ${TEXTBOX_STATUS}         ${status}
      Sleep    2
      Click Element           ${CLICK_STATUS}

Select Star and End Date Tab Semua Pesanan
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

Select Droplist Department Tab Semua Pesanan
      [Arguments]            ${department}
      Click Element                    ${DROPLIST_DEPARTMENT}
      Wait Until Element Is Visible    ${TEXTBOX_DEPARTMENT}
      Click Element      ${TEXTBOX_DEPARTMENT}
      Input Text         ${TEXTBOX_DEPARTMENT}         ${department}
      Sleep    2
      Click Element      ${CLICK_STATUS}

Select Droplist Bantuan Sales Tab Semua Pesanan
      [Arguments]            ${bantuanSales}
      # Click Element                    ${DROPLIST_BANTUANSALES}
      # Wait Until Element Is Visible     ${LIST_BANTUANSALES}
     Select From List By Label               ${LIST_BANTUANSALES}        ${bantuanSales}
      # Click Element                 ${TEXTBOX_STATUS}
      # Input Text              ${TEXTBOX_STATUS}
      # Sleep    2
      # Click Element           ${TEXTBOX_STATUS}

List First Transaction Selected
      Sleep    6
      Execute JavaScript    window.scrollTo(0,300)
      Wait Until Page Contains Element    ${LIST_FIRST}    timeout=25
      Wait Until Element Is Visible       ${LIST_FIRST}
      Click Element                       ${LIST_FIRST}



Compare Opty Name
    Execute JavaScript    window.scrollTo(0,700)
    [Arguments]        ${optyName}
    ${get_text_nama_opty}      Get Text    ${NAMAOPTY_LABEL}
    Should Be Equal As Strings            ${optyName}          ${get_text_nama_opty}
    Log To Console    Opty by Get Text =${get_text_nama_opty} and Opty By Name =${optyName}


Click Beli Dengan Bantuan Button
    Wait Until Element Is Visible     ${BELIDENGANBANTUAN_BUTTON}
    Click Element                     ${BELIDENGANBANTUAN_BUTTON}


   # Pop Up Pembelian dengan bantuan Sales
Input Nama Order Text Field From Pop Up Pembelian dengan bantuan Sales
    [Arguments]                 ${orderName}
    Wait Until Element Is Visible     ${NAMAORDER_TEXTFIELD}
    Input Text                        ${NAMAORDER_TEXTFIELD}             ${orderName}

Input Pesan Untuk Sales Text Field From Pop Up Pembelian dengan bantuan Sales
    [Arguments]                 ${pesanSales}
    Wait Until Element Is Visible     ${PESANUNTUKSALES_TEXTFIELD}
    Input Text                        ${PESANUNTUKSALES_TEXTFIELD}           ${pesanSales}

Click Submit Dengan Bantuan Button From Pop Up Pembelian dengan bantuan Sales
    Wait Until Element Is Visible     ${SUBMIT_BUTTON_ASSIS}
    Click Element                     ${SUBMIT_BUTTON_ASSIS}

Select Department From Pop Up Pembelian dengan bantuan Sales
    [Arguments]                 ${departmentName}
    Run Keyword If       '${departmentName}' == '-'
    ...     Log To Console     Department Not Found
    ...     ELSE
    ...     Select Department Droplist                  ${departmentName}

Select Department Droplist
    [Arguments]                 ${departmentName}
    Wait Until Element Is Visible     ${SELECT_DEPARTMENT_DROPLIST}
    Select From List By Label         ${SELECT_DEPARTMENT_DROPLIST}          ${departmentName}

    # Pop Up Permintaan bantuan diproses
Click Kembali Ke Dashboard Button From Pop Up Permintaan bantuan diproses
    Sleep   2
    Wait Until Element Is Visible     ${KEMBALIKEDASHBOARD_BUTTON}                  timeout=20
    Click Element                     ${KEMBALIKEDASHBOARD_BUTTON}
