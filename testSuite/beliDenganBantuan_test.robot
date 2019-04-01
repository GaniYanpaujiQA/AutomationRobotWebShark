*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/login_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/pengaturanAnakPerusahaan_pages.robot
Resource         ../PageObject/daftarTransaksi_semuaPesanan_pages.robot
Resource         ../PageObject/daftartransaksi_bantuansales_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SEARCHDATA}         b1@grr.la
*** Test Cases ***
Open Beli Dengan Bantuan Test
    [Template]    Open Beli Dengan Bantuan

    #SearchData
    ${SEARCHDATA}

*** Keywords ***
Open Beli Dengan Bantuan
        [Arguments]          ${SEARCHDATA}
        GIVEN Home Page To Login Email Page
        And Login Account Success
        # And Click Button Menu Transaksi
        And Klik Tab Semua Pesanan
        And Click Beli Dengan Bantuan Button
        WHEN Input Nama Order Text Field From Pop Up Pembelian dengan bantuan Sales                    karjo
        And Select Department From Pop Up Pembelian dengan bantuan Sales                CHILDREQUESTOR
        And Input Pesan Untuk Sales Text Field From Pop Up Pembelian dengan bantuan Sales               ${SEARCHDATA}
        And Click Submit Dengan Bantuan Button From Pop Up Pembelian dengan bantuan Sales
        THEN Click Kembali Ke Dashboard Button From Pop Up Permintaan bantuan diproses
        And Klik Tab Bantuan Sales
        And Get Request Number Bantuan Sales Tab

