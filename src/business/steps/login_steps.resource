*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            usuario_steps.resource
Resource            ../requests/login/login_requests.resource


*** Keywords ***
Login With Random User
    [Documentation]    This keyword logs in with a randomly created user.
    [Arguments]    ${newLogin}
    ${response}    Login With New User    ${newLogin}
    RETURN    ${response}
