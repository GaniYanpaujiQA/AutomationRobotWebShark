*** Settings ***
*** Variables ***
${HELLO}          Used to test that variable name, not value, is shown in arguments
*** Test Cases ***
Open Daftar Department
     Open Daftar Department Page


*** Keywords ***
Open Daftar Department Page
        ${return value} =    Wait Until Keyword Succeeds    4 seconds    0 min 0 sec 1 ms    Fail Until Retried Often Enough    ${HELLO}
    Should Be Equal    ${return value}    ${HELLO}    Returned value should be the one that is given to the keyword.
