*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${MAIN_PAGE}      http://shark-cf-development.bhinnekalocal.com/
${LOGIN_PAGE}     ${MAIN_PAGE}/accounts/login/

*** Keywords ***
Open Main Page Using Chrome Browser
  Open Browser    ${MAIN_PAGE}    Chrome

Open Login Page Using Chrome Browser
  Open Browser    ${LOGIN_PAGE}   Chrome
