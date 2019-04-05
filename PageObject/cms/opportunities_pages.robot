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
${SAVEANDCONTINUE_BUTTON_NEWOPTY}      //button[@type='button' and contains(text(),'Save and Continue')]
${SELECT_ADDRESS_DROPLIST}                      name=shippingAddress
${SELECT_SHIPPINGMETHOD_DROPLIST}                      name=shippingMethod
${SELECT_PAYMENTMETHOD_DROPLIST}                      name=paymentMethod
${SELECT_NPWP_DROPLIST}                       name=npwpAccountId
${SELECT_PHONE_DROPLIST}                      name=shippingPhone
${INPUT_SHIPPINGNOTE_TEXTAREA}                name=shippingNote
${ADDSKUTOCART_BUTTON}                        //button[@type='button' and contains(text(),'Add SKU to Cart')]

${ICONSEARCHSKU_ICON}                  id=btnSearchProduct
${SELECT_BUTTON_ADDSKU}                //button[@type='button' and contains(text(),'Select')]
${ADDTOCART_BUTTON_ADDSKU}             //button[@type='button' and contains(text(),'Add to Cart')]
${CREATE_QUOTATION_BUTTON}             //button[@type='button' and  contains(text(),'Create Quotation')]
${NEWOPTY_BUTTON}                       //a[@class='btn btn-primary btn-block-mobile ' and  contains(text(),'New Opportunity')]
${ACCOUNT_SELECT_DROPLIST}              //span[@class='Select-multi-value-wrapper']
${ACCOUNT_SELECT_DROPLIST_TEXT}         //span/div/input
${SELECTACCOUNT_DROPLIST}               //div/div[2]/div/div/div
${OPTYNAME_TEXTFIELD}                   name=optyName
${CONTACT_NAME_DROPLIST}                name=contactId
#//div[@class='Select Select--single is-clearable is-searchable has-value']/div[@classs='Select-menu-outer']/div[contains(text(),'[B2BACC00000000022815] - Cms')]
#//div[@classs='Select-menu-outer']/div/div[@class='Select-option is-selected is-focused']
# name=contactId
# //div[2]/div[2]/button[@type='button' and @class='btn btn-primary  btn btn-default']
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
    Wait Until Element Is Visible     //div[@class='react-bs-container-body']/table/tbody/tr/td/a[contains(text(),${opty_number})]             timeout=40
    Click Element                     //div[@class='react-bs-container-body']/table/tbody/tr/td/a[contains(text(),${opty_number})]


Select All Email From Dropdown
    [Arguments]       ${selectAll}
    Wait Until Element Is Visible     ${SELECTEMAIL_DROPDOWN}       timeout=40
    Click Element     ${SELECTEMAIL_DROPDOWN}
    Input Text        ${SELECTEMAIL_TEXTBOX}     ${selectAll}
    Select Checkbox    ${SELECTALL_DROPBOX}
    Sleep    4
    Wait Until Keyword Succeeds     50 seconds    0 min 0 sec 1 ms      Wait Until Element Is Enabled    ${LABEL_OPTY}
#    Wait Until Element Is Visible                ${LABEL_OPTY}       timeout=40
    Wait Until Element Is Enabled            ${LABEL_OPTY}       timeout=40
    Click Element      ${LABEL_OPTY}


Open Tab Quotations
    Sleep    3
    Wait Until Keyword Succeeds     50 seconds    0 min 0 sec 1 ms      Wait Until Element Is Visible    ${QUOTATIONS_TAB}
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

#Requestor With Oppotunity
# Oppotunities Beli Dengan bantuan
Click Save And Continue Button From Basic Info (Step 1)
    Sleep    2
    Wait Until Element Is Visible     ${SAVEANDCONTINUE_BUTTON_NEWOPTY}       timeout=20
    Click Element                     ${SAVEANDCONTINUE_BUTTON_NEWOPTY}
    Sleep    3

#Step2
Select Address From Opty Detail (Step 2)
    [Arguments]                     ${address}
    Sleep    2
    Wait Until Element Is Visible     ${SELECT_ADDRESS_DROPLIST}       timeout=20
    Select From List By Label                    ${SELECT_ADDRESS_DROPLIST}             ${address}
    Sleep    2

Select Shipping Method From Opty Detail (Step 2)
    [Arguments]                     ${shippingMethod}
    Sleep    2
    Wait Until Element Is Visible     ${SELECT_SHIPPINGMETHOD_DROPLIST}       timeout=20
    Select From List By Value                    ${SELECT_SHIPPINGMETHOD_DROPLIST}           ${shippingMethod}

Select Payment Method From Opty Detail (Step 2)
    [Arguments]                     ${paymentMethod}
    Sleep    2
    Wait Until Element Is Visible     ${SELECT_PAYMENTMETHOD_DROPLIST}       timeout=20
    Select From List By Label                      ${SELECT_PAYMENTMETHOD_DROPLIST}                 ${paymentMethod}

Select Npwp From Opty Detail (Step 2)
    [Arguments]                     ${npwp}
    Run Keyword If          '${npwp}'=='-'
    ...    Log To Console     NPWP Not Found
    ...    ELSE
    ...    Select NPWP Droplist          ${npwp}

Select NPWP Droplist
    [Arguments]                     ${npwp}
    Sleep    2
    Wait Until Element Is Visible     ${SELECT_NPWP_DROPLIST}       timeout=20
    Select From List By Label                     ${SELECT_NPWP_DROPLIST}                           ${npwp}

Select Phone From Opty Detail (Step 2)
    [Arguments]                     ${phone}
    Sleep    2
    Wait Until Element Is Visible     ${SELECT_PHONE_DROPLIST}       timeout=20
    Select From List By Label                     ${SELECT_PHONE_DROPLIST}                  ${phone}


Select Shipping Note From Opty Detail (Step 2)
    [Arguments]                     ${shippingNote}
    Sleep    2
    Wait Until Element Is Visible     ${INPUT_SHIPPINGNOTE_TEXTAREA}       timeout=20
    Input Text               ${INPUT_SHIPPINGNOTE_TEXTAREA}                 ${shippingNote}

Add SKU To Cart From Opty Detail (Step 2)
    Sleep    2
    Wait Until Element Is Visible     ${ADDSKUTOCART_BUTTON}       timeout=20
    Click Element             ${ADDSKUTOCART_BUTTON}

#Pop Up Add SKU
Search By SKU from Pop Up Add SKU (Step 2)
    Sleep    3
    Wait Until Element Is Visible     ${INPUTOPTYSEARCH_TEXTBOX}       timeout=20
    Wait Until Element Is Visible     ${ICONSEARCHSKU_ICON}       timeout=20
    Input Text               ${INPUTOPTYSEARCH_TEXTBOX}                SKU00310360
    Click Element            ${ICONSEARCHSKU_ICON}

Click Select SKU Button from Pop Up Add SKU (Step 2)
    Sleep    2
    Wait Until Element Is Visible     ${SELECT_BUTTON_ADDSKU}       timeout=20
    Click Element            ${SELECT_BUTTON_ADDSKU}

Click Add To Cart Button from Pop Up Add SKU (Step 2)
    Wait Until Element Is Visible     ${ADDTOCART_BUTTON_ADDSKU}       timeout=20
    Click Element            ${ADDTOCART_BUTTON_ADDSKU}


# Create Quotation
Click Create Quotation Button (Step 3)
    sleep      3
    Wait Until Element Is Visible     ${CREATE_QUOTATION_BUTTON}       timeout=20
    Click Element            ${CREATE_QUOTATION_BUTTON}

Click New Opty Button
    sleep      3
    Wait Until Element Is Visible     ${NEWOPTY_BUTTON}       timeout=20
    Click Element            ${NEWOPTY_BUTTON}

Select Account Droplist (Step 1)
    [Arguments]                 ${account_number}
    sleep      3
    Wait Until Element Is Visible     ${ACCOUNT_SELECT_DROPLIST}       timeout=20
    Click Element            ${ACCOUNT_SELECT_DROPLIST}
    Sleep       2
    Wait Until Keyword Succeeds     60 seconds    0 min 0 sec 1 ms      Wait Until Element Is Visible    ${ACCOUNT_SELECT_DROPLIST_TEXT}
    Input Text               ${ACCOUNT_SELECT_DROPLIST_TEXT}                 ${account_number}
    Sleep       30
    Wait Until Element Is Visible     ${SELECTACCOUNT_DROPLIST}       timeout=20
    Click Element                    ${SELECTACCOUNT_DROPLIST}
#    Select From List By Label                     ${SELECTACCOUNT_DROPLIST}                           [B2BACC00000000022815] - Cms
#    [B2BACC00000000022815] - Cms

Iput Opty Name (Step 1)
    [Arguments]                 ${opty_name}
    Wait Until Element Is Visible     ${OPTYNAME_TEXTFIELD}       timeout=20
    Input Text               ${OPTYNAME_TEXTFIELD}                 ${opty_name}


Select Contact (Step 1)
    [Arguments]                 ${contact_name}
    Wait Until Element Is Visible     ${CONTACT_NAME_DROPLIST}       timeout=20
    Select From List By Label                    ${CONTACT_NAME_DROPLIST}             ${contact_name}
