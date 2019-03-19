*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/home_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***

*** Test Cases ***
Open Home Pages
        Open Home Page


*** Keywords ***
Open Home Page
        GIVEN Home Page Opened
        WHEN Login Button Already Clicked
        THEN Login Email Page Will Be Success


Home Page Opened
        Home Page Already Opened

Login Button Already Clicked
        Klik Login Button

Login Email Page Will Be Success
        Login Email Page Opened
