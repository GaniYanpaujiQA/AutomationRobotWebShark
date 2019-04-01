*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${OPPORTUNITIES_MENU}                link=Opportunities
# //ul[@class='sidebar-menu']/li/a/span[contains(text(),'Opportunities')]
# //section[@class='sidebar']/ul[@class='sidebar-menu']/li/a/span[contains(text(),'Opportunities')]
${QUOTATIONS_MENU}                  link=Quotations
${REQUESTS_MENU}                  link=Requests
# //ul[@class='sidebar-menu']/li/a/span[contains(text(),'Quotations')]
${EMAIL_TEXTBOX}                    id=i0116  Quotations
${NEXTEMAIL_BUTTON}                 id=idSIButton9
${PASSWORD_TEXTBOX}                 id=i0118
${SIGNIN_BUTTON}                    id=idSIButton9

*** Keywords ***
Home Pages CMS Opened
    Sleep    5
    Wait Until Element Is Visible     ${QUOTATIONS_MENU}         timeout=30
    Wait Until Element Is Visible     ${OPPORTUNITIES_MENU}         timeout=30

Click Menu Opportunities
      Home Pages CMS Opened
      Click Link                   ${OPPORTUNITIES_MENU}

Click Menu Quotations
    Home Pages CMS Opened
    Click Link                   ${QUOTATIONS_MENU}

Click Menu Requests
    Home Pages CMS Opened
    Click Link                   ${REQUESTS_MENU}
