*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../../../business/steps/users_steps.resource
Resource            ../../../business/steps/login_steps.resource


*** Keywords ***
Login With New Random User
    [Documentation]    This keyword logs in with a new user.
    [Arguments]    ${idAdmin}=${EMPTY}    ${emailDomain}=${EMPTY}
    ${new_random_user}    Get User Request Body    ${idAdmin}    ${emailDomain}
    ${_}    ${new_random_login}    Register New User    ${new_random_user}
    ${new_login_user}    Get Login Request Body    ${new_random_login}[email]    ${new_random_login}[password]
    ${response}    Login New User    ${new_login_user}
    RETURN    ${response}
