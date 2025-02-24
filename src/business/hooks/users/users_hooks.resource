*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../../../business/steps/users_steps.resource
Resource            ../../../business/steps/login_steps.resource


*** Keywords ***
Register New Random User
    [Documentation]    This keyword logs in with a new user.
    [Arguments]    ${idAdmin}=${EMPTY}    ${emailDomain}=${EMPTY}
    ${new_random_user}    Get User Request Body    ${idAdmin}    ${emailDomain}
    ${response}    ${registered_user}    Register New User    ${new_random_user}
    RETURN    ${response}    ${registered_user}
