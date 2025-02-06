*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***
Login com Usuário Padrão
    ${user}    Create Dictionary
    ...    email=fulano@qa.com
    ...    password=teste
    Log    ${user}
    Create Session    serverest    https://serverest.dev
    ${response}    POST On Session    serverest    /login     json=${user} 
    Should Be Equal As Numbers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    authorization
