*** Settings ***
Documentation       Tests login with a newly registered random user.

Resource            ./test_resources/base_test_resources.resource


*** Test Cases ***
Login With New Random User
    [Documentation]    Logs in with a random user and validates the response.
    [Tags]    smoke
    Login With New Random User
    Status Should Be    ${SUCCESS_STATUS}    ${LOGIN_NEW_LOGIN_RESPONSE}
    Should Be Equal As Strings    ${LOGIN_NEW_LOGIN_RESPONSE.json()}[${MESSAGE_KEY}]    ${SUCCESS_LOGIN_MESSAGE}
    Dictionary Should Contain Key    ${LOGIN_NEW_LOGIN_RESPONSE.json()}    ${AUTH_KEY}
    Validate Login Response Schema    ${LOGIN_NEW_LOGIN_RESPONSE.json()}    ${REQ_METHODS}[POST]
