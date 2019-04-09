*** Settings ***
# Test Setup        Open Main Page Using Chrome Browser

*** Variables ***
${SKU_NUMBER}        SKU00717707
${CATATANTRANSAKSI}   SADASDASasda
${EMAIL_REQUESTOR}    a.parentadmin@grr.la
# ${EMAIL_APPROVER}     a.approver@grr.la
${PASSWORD}           Bhinneka321
${UNIT_BISNIS}        UB2 Requestor
${SELECTALL}          Select All
${TEXTAREA}           SADSAsadsaad asda asdsad
${OPTYNAME}             dasdas

*** Keywords ***
Get Data From Environment
    [Arguments]                    ${env}
        Run Keyword If       '${ENV}' == 'STAGING'
    ...     Set Data Staging
    ...     ELSE
    ...     Set Data Development

Set Data Staging
#   1= account default, 2= account parent, 3=account child
    Set Global Variable                  ${SKU_NUMBER}         SKU00717707
    Set Global Variable                  ${CATATANTRANSAKSI}   SADASDASasda
    Set Global Variable                  ${SELECTALL}          Select All
    Set Global Variable                  ${TEXTAREA}           SADSAsadsaad asda asdsad
    Set Global Variable                  ${OPTYNAME}           dasdas

    Set Global Variable                  ${PASSWORD}           Bhinneka321
#    Email Requestor
    Set Global Variable                  ${EMAIL_REQUESTOR1}    a.requestor@grr.la
    Set Global Variable                  ${EMAIL_REQUESTOR2}    a.parentrequestor@grr.la
    Set Global Variable                  ${EMAIL_REQUESTOR3}    a.parentchildrequestor@grr.la

#    Email Admin
    Set Global Variable                  ${EMAIL_ADMIN1}    a.admin@grr.la
    Set Global Variable                  ${EMAIL_ADMIN2}    a.parentadmin@grr.la
    Set Global Variable                  ${EMAIL_ADMIN3}    a.parentchild@grr.la

#    Email APPROVER
    Set Global Variable                  ${EMAIL_APPROVER1}    a.approver@grr.la
    Set Global Variable                  ${EMAIL_APPROVER2}    a.parentapprover@grr.la
    Set Global Variable                  ${EMAIL_APPROVER3}    a.parentchildapprover@grr.la

#   UNIT BISNIS
    Set Global Variable                  ${UNIT_BISNIS1_APPROVER}        UB1
    Set Global Variable                  ${UNIT_BISNIS1_REQUESTOR}       UB2 Requestor

    Set Global Variable                  ${UNIT_BISNIS2_APPROVER}        parentapprover
    Set Global Variable                  ${UNIT_BISNIS2_REQUESTOR}       Parentrequestor

    Set Global Variable                  ${UNIT_BISNIS3_APPROVER}        childapprover
    Set Global Variable                  ${UNIT_BISNIS3_REQUESTOR}       childrequestor


#   ANAK PERUSAHAAN
    Set Global Variable                  ${PILIHPERUSAHAAN2}              PT_PERSERO Parent Child


#   ADDRESS
    Set Global Variable                  ${ADDRESS1}              Organisasi A Address 1
    Set Global Variable                  ${ADDRESS2}              Parent Admin Address 1
    Set Global Variable                  ${ADDRESS3}              Parent Child Address 1

#   NPWP
    Set Global Variable                  ${NPWP1}              NPWP Name
    Set Global Variable                  ${NPWP2}              asdas
    Set Global Variable                  ${NPWP3}              adsa asd

#   Phone Numb
    Set Global Variable                  ${PHONE1}              0812313123123
    Set Global Variable                  ${PHONE2}              Rumah
    Set Global Variable                  ${PHONE3}              asdsad

Set Data Development
    #   1= account default, 2= account parent, 3=account child
    Set Global Variable                  ${SKU_NUMBER}         SKU00717707
    Set Global Variable                  ${CATATANTRANSAKSI}   SADASDASasda\
    Set Global Variable                  ${SELECTALL}          Select All
    Set Global Variable                  ${TEXTAREA}           SADSAsadsaad asda asdsad
    Set Global Variable                  ${OPTYNAME}           dasdas

    Set Global Variable                  ${PASSWORD}           Bhinneka321
#    Email Requestor
    Set Global Variable                  ${EMAIL_REQUESTOR1}    a.requestor@grr.la
    Set Global Variable                  ${EMAIL_REQUESTOR2}    a.parentrequestor@grr.la
    Set Global Variable                  ${EMAIL_REQUESTOR3}    a.parentchildrequestor@grr.la

#    Email Admin
    Set Global Variable                  ${EMAIL_ADMIN1}    a.admin@grr.la
    Set Global Variable                  ${EMAIL_ADMIN2}    a.parentadmin@grr.la
    Set Global Variable                  ${EMAIL_ADMIN3}    a.parentchild@grr.la

#    Email APPROVER
    Set Global Variable                  ${EMAIL_APPROVER1}    a.approver@grr.la
    Set Global Variable                  ${EMAIL_APPROVER2}    a.parentapprover@grr.la
    Set Global Variable                  ${EMAIL_APPROVER3}    a.parentchildapprover@grr.la

#   UNIT BISNIS
    Set Global Variable                  ${UNIT_BISNIS1_APPROVER}        UB1
    Set Global Variable                  ${UNIT_BISNIS1_REQUESTOR}       UB2 REQUESTOR

    Set Global Variable                  ${UNIT_BISNIS2_APPROVER}        PARENTAPPROVER
    Set Global Variable                  ${UNIT_BISNIS2_REQUESTOR}       PARENTREQUESTOR

    Set Global Variable                  ${UNIT_BISNIS3_APPROVER}        CHILDAPPROVER
    Set Global Variable                  ${UNIT_BISNIS3_REQUESTOR}       CHILDREQUESTOR


#   ANAK PERUSAHAAN
    Set Global Variable                  ${PILIHPERUSAHAAN2}             PT_TBK Parent Child


#   ADDRESS
    Set Global Variable                  ${ADDRESS1}              Admin Default Address 1
    Set Global Variable                  ${ADDRESS2}              Parent Admin Address 1
    Set Global Variable                  ${ADDRESS3}              Parent Child Address 1

#   NPWP
    Set Global Variable                  ${NPWP1}              NPWP Name
    Set Global Variable                  ${NPWP2}              asdas
    Set Global Variable                  ${NPWP3}              assa sadsa

#   Phone Numb
    Set Global Variable                  ${PHONE1}              asdsadsad
    Set Global Variable                  ${PHONE2}              Rumah
    Set Global Variable                  ${PHONE3}              0812312312312