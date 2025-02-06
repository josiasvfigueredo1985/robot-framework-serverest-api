*** Settings ***
Resource    ../framework/base/base.resources.resource
Library    Collections
Library    JSONLibrary

Suite Setup    Start Session
Suite Teardown  End Session

*** Test Cases ***
Login com Usuário Padrão
    ${user}    Create Dictionary
    ...    email=beltrano123@qa.com.br
    ...    password=teste
    Log    ${user}
    ${params}    Create Dictionary    email=fulano@qa.com
    ${response}    GET By Query   /usuarios       ${params} 
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal As Integers  ${response.json()}[quantidade]     1
     Should Be Equal As Strings  ${response.json()}[usuarios][0][password]   teste