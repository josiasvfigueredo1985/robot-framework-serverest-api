*** Settings ***
Documentation       This resource file contains login request keywords.

Resource            ../usuarios/usuarios_requests.resource


*** Variables ***
${LOGIN_RESOURCE}=      login


*** Keywords ***
Login With New User
    [Documentation]    This keyword logs in with a randomly created user.
    [Arguments]    ${new_user_object}
    ${response}    POST Data    ${LOGIN_RESOURCE}    ${new_user_object}
    RETURN    ${response}
