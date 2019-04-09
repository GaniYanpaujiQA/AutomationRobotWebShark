*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         RequestsLibrary
Library         JSONLibrary
Library         OperatingSystem
Library         RequestsLibrary
Library         HttpLibrary.HTTP
*** Variables ***
# ${json_object}              asdas
# ${headers}                  sadsad
# ${resp}                     asdsad
# ${body}                     madsasd

*** Keywords ***

Set Location JSON QuoatationHistoryAPI
    ${json_object}=     Load Json From File    /Users/ganiyanpauji/Documents/SharkWEB\ Kebutuhan\ Test/testSuite/apiTest/testjson.json
    Set Global Variable     ${json_object}      ${json_object}


Add Headers QuoatationHistoryAPI
    ${headers}=  Create Dictionary  Content-Type=application/json   Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLndpbmRvd3MubmV0IiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvNzQ4Y2U0NmEtOWNmZC00YTQ0LWFlNmYtNGI2MzQxZWNiNTU1LyIsImlhdCI6MTU1NDc4MjQ1MywibmJmIjoxNTU0NzgyNDUzLCJleHAiOjE1NTQ4NTExNTMsImFjciI6IjEiLCJhaW8iOiI0MlpnWURpK3VQMjd3SUh0TjY3a0xwdTFWZDh6TjdQY3kyc3BsL1pCelNuS2YveUVVazBCIiwiYW1yIjpbInB3ZCJdLCJhcHBpZCI6IjJlOTBhOTM5LTYxZjItNDFlNi1iM2E3LWJjMmRjM2RhMjEzOCIsImFwcGlkYWNyIjoiMSIsImZhbWlseV9uYW1lIjoiUUEiLCJnaXZlbl9uYW1lIjoiQXV0byIsImlwYWRkciI6IjEyMy4yMzEuMjM3LjgyIiwibmFtZSI6IkF1dG8gUUEiLCJvaWQiOiI1NzhiNmRkYS1kNTU2LTRkZjUtYTA3ZC1kM2M3M2ViY2U4OGEiLCJvbnByZW1fc2lkIjoiUy0xLTUtMjEtNTkwMjQ4ODYtMzQyNzI1Mzg5NC0zMzg5Njk5MjMzLTI5MTkxIiwicHVpZCI6IjEwMDM3RkZFQTVBODI2RDAiLCJzY3AiOiJEaXJlY3RvcnkuUmVhZC5BbGwgVXNlci5SZWFkIFVzZXIuUmVhZC5BbGwgVXNlci5SZWFkQmFzaWMuQWxsIiwic3ViIjoiUnlVWlFhX3p1dHd5WThwc3c1dDFQTWJSZE54RzdQblUwY2QteTN6cGxjdyIsInRlbmFudF9yZWdpb25fc2NvcGUiOiJBUyIsInRpZCI6Ijc0OGNlNDZhLTljZmQtNGE0NC1hZTZmLTRiNjM0MWVjYjU1NSIsInVuaXF1ZV9uYW1lIjoiYXV0b3FhQGJoaW5uZWthLmNvbSIsInVwbiI6ImF1dG9xYUBiaGlubmVrYS5jb20iLCJ1dGkiOiI2VHRhR1V2UTNVT2tGbVg2dTRSWUFBIiwidmVyIjoiMS4wIiwidXNlcmlkIjoxNTl9.h6kiJLrfJCC__4UJI_rJAmnteGow91MK6ltz3QJcPiM
    Set Global Variable     ${headers}      ${headers}


Send Post Request QuoatationHistoryAPI
    ${resp} =   Get Request   Shark      /quotation/${quotation_number}/   headers=${headers}
    Set Global Variable    ${resp}       ${resp}

Get Opty
    log to console          ${resp.json()}
    ${body}=  Set Variable  ${resp.json()}
    ${data}=  Get From Dictionary   ${body}         data

#    ${list}=    Get From List       ${data}     0
    ${opty}=    Get From Dictionary  ${data}    optyId
    ${item1}=     set variable  ${opty}
    Set Global Variable    ${opty_number}       ${item1}
    log to console      =============""= ${opty_number}



