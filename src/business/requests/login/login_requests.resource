*** Settings ***
Documentation       This resource file contains login request keywords.

Resource            ../usuarios/usuarios_requests.resource


*** Keywords ***
Login With New User
    [Documentation]    This keyword logs in with a randomly created user.
    [Arguments]    ${new_user_object}
    ${response}    POST Data    /login    ${new_user_object}
    RETURN    ${response}
