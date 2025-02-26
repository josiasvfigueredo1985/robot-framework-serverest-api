*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ../framework/base/base_test_resources.resource


*** Test Cases ***
Cadastrar Novo Produto Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    ${response}    ${_}    ${_}    Register New Random Product
    VAR    ${response}=    ${response[0]}
    Log    ${response}
    Should Be Equal As Numbers    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    _id
