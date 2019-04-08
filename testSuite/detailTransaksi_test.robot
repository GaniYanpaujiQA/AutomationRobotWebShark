*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/login_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/detail_product_pages.robot
Resource          ../PageObject/detailTransaksi_pages.robot
Resource          ../PageObject/daftarTransaksi_semuaPesanan_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SKU_NUMBER}        SKU00717707
${CATATANTRANSAKSI}   SADASDASasda
*** Test Cases ***
Detail Product Search by SKU
    [Template]    Open Detail Product by SKU
    #SearchData           catatan trx
    ${SKU_NUMBER}        ${CATATANTRANSAKSI}

*** Keywords ***
Open Detail Product by SKU
        [Arguments]          ${SKU_NUMBER}         ${CATATANTRANSAKSI}
        GIVEN Home Page To Login Email Page
        and Login Account Success
        and Open Detail Page After Search SKU            ${SKU_NUMBER}
        and Add To Cart Product
        and List Transaction Opened    CHILDAPPROVER
        and List First Transaction Selected
        WHEN Detail Transaksi Opened
        and Click Submit Button From Detail Transaksi
        and Input Tambahkan Catatan Field     ${opty_number}
        and Click Buat Order Button
        THEN Click Hyperlink Kembali
