*** Settings ***
Resource    ../business/bases/base.resources.resource
Suite Setup    Start Session
Suite Teardown  End Session

*** Test Cases ***
Login com Usuário Padrão
    ${user}    Create Dictionary
    ...    email=fulano@qa.com
    ...    password=teste
    Log    ${user}
    ${response}    POST On Session    serverest    /login     json=${user} 
    Should Be Equal As Numbers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    authorization
