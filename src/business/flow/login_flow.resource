*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../../business/steps/usuario_steps.resource
Resource            ../../business/steps/login_steps.resource


*** Keywords ***
Login With New Random User
    [Documentation]    This keyword logs in with a new user.
    ${new_random_user}    Create New User
    ${_}    ${new_random_login}    Register New User    ${new_random_user}
    ${new_login_user}    Create Login    ${new_random_login}[email]    ${new_random_login}[password]
    ${response}    Login With New User    ${new_login_user}
    RETURN    ${response}
