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
    ${json_object}=     Load Json From File    /Users/julitaulismiasari/Documents/AutomationShark/AutomationRobotWebShark/testSuite/apiTest/testjson.json

    Set Global Variable     ${json_object}      ${json_object}


Add Headers QuoatationHistoryAPI
    ${headers}=  Create Dictionary  Content-Type=application/json   Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLndpbmRvd3MubmV0IiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvNzQ4Y2U0NmEtOWNmZC00YTQ0LWFlNmYtNGI2MzQxZWNiNTU1LyIsImlhdCI6MTU1NDg4NDY4NCwibmJmIjoxNTU0ODg0Njg0LCJleHAiOjE1NTQ5NTMzODQsImFjciI6IjEiLCJhaW8iOiJBU1FBMi84TEFBQUE2ZmZUd2kwTndjVVVzSThKMzVHOTU3b01xUkluUFNncEN0aG5PRzhtSjY0PSIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiIyZTkwYTkzOS02MWYyLTQxZTYtYjNhNy1iYzJkYzNkYTIxMzgiLCJhcHBpZGFjciI6IjEiLCJmYW1pbHlfbmFtZSI6IlFBIiwiZ2l2ZW5fbmFtZSI6IkF1dG8iLCJpcGFkZHIiOiIxMjMuMjMxLjIzNy44MiIsIm5hbWUiOiJBdXRvIFFBIiwib2lkIjoiNTc4YjZkZGEtZDU1Ni00ZGY1LWEwN2QtZDNjNzNlYmNlODhhIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTU5MDI0ODg2LTM0MjcyNTM4OTQtMzM4OTY5OTIzMy0yOTE5MSIsInB1aWQiOiIxMDAzN0ZGRUE1QTgyNkQwIiwic2NwIjoiRGlyZWN0b3J5LlJlYWQuQWxsIFVzZXIuUmVhZCBVc2VyLlJlYWQuQWxsIFVzZXIuUmVhZEJhc2ljLkFsbCIsInN1YiI6IlJ5VVpRYV96dXR3eVk4cHN3NXQxUE1iUmROeEc3UG5VMGNkLXkzenBsY3ciLCJ0ZW5hbnRfcmVnaW9uX3Njb3BlIjoiQVMiLCJ0aWQiOiI3NDhjZTQ2YS05Y2ZkLTRhNDQtYWU2Zi00YjYzNDFlY2I1NTUiLCJ1bmlxdWVfbmFtZSI6ImF1dG9xYUBiaGlubmVrYS5jb20iLCJ1cG4iOiJhdXRvcWFAYmhpbm5la2EuY29tIiwidXRpIjoidHdnVkRBQ3JYa2VfYzNHUVRQcVpBQSIsInZlciI6IjEuMCIsInVzZXJpZCI6MTU5fQ.VakZCvymSpph_ueMe0OE-eBnmNIcpQS5ybU1aM5ywzg
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



