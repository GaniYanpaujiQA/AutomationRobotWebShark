*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${BELISEKARANG_BUTTON}           //button[@class='btn btn-lg btn-warning btn-icon' and @type='button']
${PILIHUNITBISNIS_DROPLIST}      //div[@class='btn-group bootstrap-select form-control']/button[@data-id='selectDepartment']/span[@class='filter-option pull-left']
${PILIHUNITBISNIS_CLICKDROPDOWN}     //div/ul[@class='dropdown-menu inner']/li[@class='active']/a/span[@class='text']
${PILIHUNITBISNIS_TEXTBOX}       //div[@class='bs-searchbox']/input[@type='text' and @class='form-control']
${PILIHKERANJANG_HYPERLINK}      //div/address/a[@class='btn btn-link select-card']
${KERANJANG_LINK}                 //a[contains(text(),'Pilih Keranjang')]
${KERANJANGBARU_HYPERLINK}       //a[@class='btn btn-link']
${LANJUTKEKERANJANG_BUTTON}      id=btnGoToCart

${PILIHPERUSAHAAN_DROPLIS}       //div[@class='btn-group bootstrap-select form-control']/button[@data-id='selectCompany']/span[@class='filter-option pull-left']


*** Keywords ***
Detail Product Already Opened
    Wait Until Element Is Visible    ${BELISEKARANG_BUTTON}


Click Beli Sekarang Button
    Sleep    2
    Click Element                    ${BELISEKARANG_BUTTON}
    # Wait Until Element Is Visible    ${PILIHUNITBISNIS_DROPLIST}



Add To Cart Product
    Detail Product Already Opened
    Click Beli Sekarang Button

# Pop up Tambah Keranjang

Select Tipe Unit Bisnis
    [Arguments]                ${unitBisnis}
    Sleep    2
    Click Element                    ${PILIHUNITBISNIS_DROPLIST}
    Input Text                       ${PILIHUNITBISNIS_TEXTBOX}         ${unitBisnis}
    Click Element                    ${PILIHUNITBISNIS_CLICKDROPDOWN}
    Wait Until Element Is Visible    ${PILIHKERANJANG_HYPERLINK}

Click Pilih Keranjang Hyperlink
    Click Element         ${PILIHKERANJANG_HYPERLINK}

Click Keranjang Baru Hyperlink
    Wait Until Element Is Visible    ${KERANJANGBARU_HYPERLINK}
    Click Element                    ${KERANJANGBARU_HYPERLINK}

Click Keranjang Already Use Hyperlink
    Wait Until Element Is Visible       id=${opty_number}
    Click Element                       id=${opty_number}

Click Lanjut Ke keranjang Button
    Wait Until Element Is Visible    ${LANJUTKEKERANJANG_BUTTON}
    Click Element                    ${LANJUTKEKERANJANG_BUTTON}
    Sleep    2

List Transaction Opened
    [Arguments]                ${unitBisnis}
    Select Tipe Unit Bisnis      ${unitBisnis}
    Click Pilih Keranjang Hyperlink
    Click Keranjang Baru Hyperlink
    Click Lanjut Ke keranjang Button

# Unit Bisnis dengan cart yang terdaftar
List Transaction Opened Already Cart
    [Arguments]                ${unitBisnis}
    Select Tipe Unit Bisnis      ${unitBisnis}
    Click Pilih Keranjang Hyperlink
    Click Keranjang Already Use Hyperlink
    Click Lanjut Ke keranjang Button

List Transaction Opened Without Unit Bisnis
    Click Pilih Keranjang For Admin
    Click Keranjang Baru Hyperlink
    Click Lanjut Ke keranjang Button

# Keranjang yang sudah terisi
List Transaction Opened Without Unit Bisnis Already Cart
    Click Pilih Keranjang For Admin
    Click Keranjang Already Use Hyperlink
    Click Lanjut Ke keranjang Button

Click Pilih Keranjang For Admin
    Sleep    2
    Wait Until Element Is Visible         ${KERANJANG_LINK}           timeout=15
    Click Element           ${KERANJANG_LINK}

List Transaction Opened With Select Company
    [Arguments]                 ${pilih_perusahaan}
    Select Pilih Perusahaan Field       ${pilih_perusahaan}
    Click Pilih Keranjang For Admin
    Click Keranjang Baru Hyperlink
    Click Lanjut Ke keranjang Button

# Keranjang yang sudah terisi
List Transaction Opened With Select Company Cart Already Used
    [Arguments]                 ${pilih_perusahaan}
    Select Pilih Perusahaan Field       ${pilih_perusahaan}
    Click Pilih Keranjang For Admin
    Click Keranjang Already Use Hyperlink
    Click Lanjut Ke keranjang Button


Select Pilih Perusahaan Field
    [Arguments]                      ${pilih_perusahaan}
    Sleep    2
    Click Element                    ${PILIHPERUSAHAAN_DROPLIS}
    Input Text                       ${PILIHUNITBISNIS_TEXTBOX}         ${pilih_perusahaan}
    Click Element                    ${PILIHUNITBISNIS_CLICKDROPDOWN}
    Wait Until Element Is Visible    ${PILIHKERANJANG_HYPERLINK}
