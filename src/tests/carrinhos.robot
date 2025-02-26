*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ../framework/base/base_test_resources.resource


*** Test Cases ***
Cadastrar Carrinho Com Novo Produto Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    ${response}    ${random_user}    Register New Random User
    Log    ${random_user}
    VAR    ${response}=    ${response[0]}
    Should Be Equal As Numbers    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    _id
