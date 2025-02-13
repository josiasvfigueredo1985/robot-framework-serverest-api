*** Settings ***
Documentation       Suite for testing user registration

Resource            ../business/flow/usuario_flow.resource
Resource            ../framework/base/base_test_resources.resource

Test Teardown       End API Session


*** Test Cases ***
Cadastrar um novo usuário aleatório
    [Documentation]    This test case registers a new random user and verifies the response.
    ${response}    ${random_user}    Register New Random User
    Log    ${random_user}
    Should Be Equal As Numbers    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    _id
