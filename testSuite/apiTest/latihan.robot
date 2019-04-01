*** Settings ***

*** Variables ***
${departmentName}               dsada
#
#
*** Test Cases ***
Opty Num
    Get Opty Num From Backend
*** Keywords ***
Get Opty Num From Backend
    Run Keyword If       '${departmentName}' == '-'
    ...     Log To Console     Department Not Found

    ...     ELSE
    ...     Warga Pintar


Warga Pintar
    Log To Console     Cebong Else