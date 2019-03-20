*** Settings ***
Resource          ../resources.robot
Resource          ../PageObject/loginEmail_pages.robot
Resource          ../PageObject/loginPassword_pages.robot
Resource          ../PageObject/home_pages.robot
Resource          ../PageObject/menu_pages.robot
Resource          ../PageObject/inbox_pages.robot
Test Setup        Open Main Page Using Chrome Browser

*** Variables ***

*** Test Cases ***
Open Inbox
        Open Inbox Page


*** Keywords ***
Open Inbox Page
        GIVEN Page Inbox Already Opened
        WHEN Click Inbox
        THEN Page Inbox will be displayed


Page Inbox Already Opened
        Home Page To Login Email Page
        Login Email Page To Login Password Page
        Login Password

Click Inbox
        Menu Profil Already Opened
        Klik Button Menu Inbox


Page Inbox will be displayed
        Menu Inbox Already Opened
        Klik Message 1
