*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ../framework/base/base_test_resources.resource


*** Test Cases ***
Login Com Novo Usuário Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    Login With New Random User
    Should Be Equal As Numbers    ${LOGIN_NEW_LOGIN_RESPONSE.status_code}    200
    Should Be Equal As Strings    ${LOGIN_NEW_LOGIN_RESPONSE.json()}[message]    Login realizado com sucesso
    Dictionary Should Contain Key    ${LOGIN_NEW_LOGIN_RESPONSE.json()}    authorization
