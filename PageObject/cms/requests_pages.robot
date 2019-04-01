*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${SEARCH_TEXTFIELD_REQUEST}                 name=search
#//div[@class='box-header']/div[@class='row']/div[@class='col-lg-3 col-md-3 col-sm-12 col-xs-12']/form[@class='form-horizontal']/div[@class='input-group-lg']/div[@class='form-group']/span[@class='input-group']/input[@type='text' and @name='search']
${ICONOPTYSEARCH_TEXTBOX_REQUEST}           //span[@class='input-group-btn']/button[@type='submit']
# //ul[@class='sidebar-menu']/li/a/span[contains(text(),'Opportunities')]
#Request Detail
${ACCEPT_REQUEST_DETAIL}                    //button[@type='button' and @class='btn btn-primary']


*** Keywords ***
Requests Page Opened
    Sleep      3
    Wait Until Element Is Visible     ${SEARCH_TEXTFIELD_REQUEST}         timeout=30
    Wait Until Element Is Enabled     ${ICONOPTYSEARCH_TEXTBOX_REQUEST}

Search Data From Requests Page
     [Arguments]                ${opty_number}
#     Wait Until Element Is Visible     ${SEARCH_TEXTFIELD_REQUEST}       timeout=15
     Click Element        ${SEARCH_TEXTFIELD_REQUEST}
     Input Text           ${SEARCH_TEXTFIELD_REQUEST}            ${opty_number}
     Click Element        ${ICONOPTYSEARCH_TEXTBOX_REQUEST}


Select List Request By Request Number
    [Arguments]             ${request_number}
    Sleep    2
    Wait Until Element Is Visible               //a[contains(text(),'${request_number}')]
    Click Element                               //a[contains(text(),'${request_number}')]

# Requst Detail Pop Up
Click Accept From Pop Up Request Detail
    Sleep    2
    Wait Until Element Is Visible               ${ACCEPT_REQUEST_DETAIL}
    Click Element                               ${ACCEPT_REQUEST_DETAIL}


