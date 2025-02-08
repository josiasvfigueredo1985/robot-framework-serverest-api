*** Settings ***
Resource            ../framework/base/base.resources.resource

Test Teardown      End Session


*** Test Cases ***
Login com Usuário Padrão
    ${user}    Create Login    fulano@qa.com    teste
    ${response}    base.request.api.POST Data    /login    ${user}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Login realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    authorization

Login com novo usuário aleatório
    ${response}    Login com usuário aleatório
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Login realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    authorization
    ${bearer}    Get Bearer Token
    Log    ${bearer}
