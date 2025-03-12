*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../../../business/steps/users_steps.resource
Resource            ../../../business/steps/login_steps.resource


*** Variables ***
${USERS_NEW_USER_RESPONSE}=         ${EMPTY}
${USERS_NEW_USER_REQUEST_BODY}=     ${EMPTY}


*** Keywords ***
Register New Random User
    [Documentation]    HOOKS - Register a new user
    ...    and sets suite variable USERS_NEW_USER_RESPONSE
    ...    and USERS_NEW_USER_REQUEST_BODY.
    [Arguments]    ${idAdmin}=${EMPTY}    ${emailDomain}=${EMPTY}
    ${user_request_body}    Get User Request Body    ${idAdmin}    ${emailDomain}
    ${response}    Register New User    ${user_request_body}
    Set Suite Variable    ${USERS_NEW_USER_REQUEST_BODY}    ${user_request_body}
    Set Suite Variable    ${USERS_NEW_USER_RESPONSE}    ${response}
