*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ./test_resources/base_test_resources.resource


*** Test Cases ***
Login Com Novo Usuário Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    [Tags]    -smoke
    Login With New Random User
    Status Should Be    ${SUCCESS_STATUS}    ${LOGIN_NEW_LOGIN_RESPONSE}
    Should Be Equal As Strings    ${LOGIN_NEW_LOGIN_RESPONSE.json()}[${MESSAGE_KEY}]    ${SUCCESS_LOGIN_MESSAGE}
    Dictionary Should Contain Key    ${LOGIN_NEW_LOGIN_RESPONSE.json()}    ${AUTH_KEY}
    Validate Login Response Schema    ${LOGIN_NEW_LOGIN_RESPONSE.json()}    ${REQ_METHODS}[POST]
