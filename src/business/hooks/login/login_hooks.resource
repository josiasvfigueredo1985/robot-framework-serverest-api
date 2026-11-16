*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../../steps/users_steps.resource
Resource            ../../steps/login_steps.resource
Resource            ../users/users_hooks.resource


*** Variables ***
${LOGIN_NEW_LOGIN_RESPONSE}=    ${EMPTY}
${LOGIN_BEARER_TOKEN}=          ${EMPTY}


*** Keywords ***
Login With New Random User
    [Documentation]    HOOKS - Logs in with a new user
    ...    and sets suite variables LOGIN_NEW_LOGIN_RESPONSE and LOGIN_BEARER_TOKEN.
    [Arguments]    ${is_admin}=${EMPTY}    ${email_domain}=${EMPTY}
    Register New Random User    ${is_admin}    ${email_domain}
    ${login_request_body}=    Get Login Request Body
    ...    ${USERS_NEW_USER_REQUEST_BODY}[email]
    ...    ${USERS_NEW_USER_REQUEST_BODY}[password]
    ${response_login}=    Login New User    ${login_request_body}
    Set Suite Variable    ${LOGIN_NEW_LOGIN_RESPONSE}    ${response_login}    # robocop: off
    Set Suite Variable    ${LOGIN_BEARER_TOKEN}    ${response_login.json()}[authorization]    # robocop: off

Validate Login Response Schema
    [Documentation]    HOOKS - Validate response by schema file.
    [Arguments]    ${response}    ${request_method}
    Validate Response By Schema File    ${response}    ${LOGIN_RESOURCE}    ${request_method}
