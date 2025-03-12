*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../../../business/steps/users_steps.resource
Resource            ../../../business/steps/login_steps.resource
Resource            ../users/users_hooks.resource


*** Variables ***
${LOGIN_NEW_LOGIN_RESPONSE}=    ${EMPTY}


*** Keywords ***
Login With New Random User
    [Documentation]    HOOKS - Logs in with a new user
    ...    and sets suite variables LOGIN_NEW_LOGIN_RESPONSE.
    [Arguments]    ${idAdmin}=${EMPTY}    ${emailDomain}=${EMPTY}
    Register New Random User    ${idAdmin}    ${emailDomain}
    ${login_request_body}    Get Login Request Body
    ...    ${USERS_NEW_USER_REQUEST_BODY}[email]
    ...    ${USERS_NEW_USER_REQUEST_BODY}[password]
    ${response_login}    Login New User    ${login_request_body}
    Set Suite Variable    ${LOGIN_NEW_LOGIN_RESPONSE}    ${response_login}
