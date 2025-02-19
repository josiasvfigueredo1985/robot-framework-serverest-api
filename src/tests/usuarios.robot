*** Settings ***
Documentation       Suite for testing user registration

Resource            ../framework/base/base_test_resources.resource
# Suite Teardown    End API Session


*** Test Cases ***
Cadastrar um novo usuário aleatório
    [Documentation]    This test case registers a new random user and verifies the response.
    ${response}    ${random_user}    Register New Random User
    Log    ${random_user}
    VAR    ${response}=    ${response[0]}
    Should Be Equal As Numbers    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    _id
