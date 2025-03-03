*** Settings ***
Documentation       Suite for testing user registration

Resource            ../framework/base/base_test_resources.resource


*** Test Cases ***
Cadastrar Novo Usuário Aleatório
    [Documentation]    This test case registers a new random user and verifies the response.
    Register New Random User
    Should Be Equal As Numbers    ${USERS_NEW_USER_RESPONSE.status_code}    201
    Should Be Equal As Strings    ${USERS_NEW_USER_RESPONSE.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${USERS_NEW_USER_RESPONSE.json()}    _id
