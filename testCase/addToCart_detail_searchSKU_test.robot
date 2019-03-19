*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/login_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/detail_product_pages.robot
Resource          ../PageObject/daftarTransaksi_semuaPesanan_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         3320724191
*** Test Cases ***
Detail Product Search by SKU
    [Template]    Open Detail Product by SKU
    #SearchData
    ${SEARCHDATA}

*** Keywords ***
Open Detail Product by SKU
        [Arguments]          ${SEARCHDATA}
        GIVEN Home Page To Login Email Page
        and Login Account Success
        and Open Detail Page After Search SKU
        and Add To Cart Product
        WHEN Select Tipe Unit Bisnis
        And Click Pilih Keranjang Hyperlink
        And Click Keranjang Baru Hyperlink
        And Click Lanjut Ke keranjang Button
        THEN List First Transaction Sowed
