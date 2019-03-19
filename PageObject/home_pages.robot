*** Settings ***
Library       SeleniumLibrary
Resource      ../resources.robot

*** Variables ***
${LOGIN_BUTTON_CF}                   //div[@class='container']/div[@class='bt-navbar__login']/a[contains(text(),'Login')]
${HEADER_LOGINUSER}              //div[@class='navbar-cart dropdown bt-navbar__cart']
${HEADER_SEARCH}                  id=nav-search
${DAFTAR_PRODUCT}               //div[@class='col-md-9 bt-product-main-info']
${SEARCH_ICON}                   //div[@class='navbar-search__btn-wrapper']/button
*** Keywords ***
Home Page Already Opened
    Wait Until Element Is Visible    ${LOGIN_BUTTON_CF}

Klik Login Button
    Click Element                    ${LOGIN_BUTTON_CF}

Home Page After Login
    Wait Until Element Is Visible    ${HEADER_LOGINUSER}
    Wait Until Element Is Visible    ${HEADER_SEARCH}

Input Searh Textbox
    [Arguments]               ${skuNumber}
    Input Text    ${HEADER_SEARCH}     ${skuNumber}

Click List Product Showed
    Wait Until Element Is Visible    ${DAFTAR_PRODUCT}
    Click Element                    ${DAFTAR_PRODUCT}

Search Product by SKU
    [Arguments]                 ${skuNumber}
    Home Page After Login
    Input Searh Textbox    ${skuNumber}
    Click Element           ${SEARCH_ICON}

Product by SKU Showed
    Click List Product Showed

Detail Product by SKU
    [Arguments]         ${skuNumber}
    Search Product by SKU    ${skuNumber}


Open Detail Page After Search SKU
    [Arguments]               ${skuNumber}
    Detail Product by SKU          ${skuNumber}
    Click List Product Showed

Home Page To Login Email Page
    Home Page Already Opened
    Klik Login Button

Product Add To Cart by Search
    [Arguments]                 ${skuNumber}
    Search Product by SKU    ${skuNumber}
    Click List Product Showed
