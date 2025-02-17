*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            usuario_steps.resource
Resource            ../requests/login/login_requests.resource


*** Keywords ***
Login New User
    [Documentation]    This keyword logs in with a randomly created user.
    [Arguments]    ${data}
    ${response}    Post Login    ${data}
    RETURN    ${response}
