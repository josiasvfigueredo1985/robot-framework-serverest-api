*** Settings ***
Resource            ../framework/base/base.resources.resource

Test Teardown      End Session


*** Test Cases ***
Cadastrar um novo usuário aleatório
    ${response}    ${randomuser}    Cadastrar usuário aleatório
    Log    ${randomuser}
    Should Be Equal As Numbers    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    _id
