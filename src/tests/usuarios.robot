*** Settings ***
Documentation       Suite for testing user registration

Resource            ./test_resources/base_test_resources.resource


*** Test Cases ***
Cadastrar Novo Usuário Aleatório
    [Documentation]    This test case registers a new random user and verifies the response.
    Register New Random User
    Should Be Equal As Numbers    ${USERS_NEW_USER_RESPONSE.status_code}    ${CREATED_STATUS}
    Should Be Equal As Strings    ${USERS_NEW_USER_RESPONSE.json()}[${MESSAGE_KEY}]    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${USERS_NEW_USER_RESPONSE.json()}    ${ID_KEY}
    Validate Common Response    ${USERS_NEW_USER_RESPONSE.json()}    ${COMM_MESSAGE}[SUCCESS]
