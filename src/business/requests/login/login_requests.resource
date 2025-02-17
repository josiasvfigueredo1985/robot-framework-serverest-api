*** Settings ***
Documentation       This resource file contains login request keywords.

Resource            ../usuarios/usuarios_requests.resource


*** Variables ***
${LOGIN_RESOURCE}=      login


*** Keywords ***
Post Login
    [Documentation]    Login user
    ...    - A duração do token retornado em authorization é de 600 segundos (10 minutos).
    ...    - Caso esteja expirado irá receber status code 401 (Unauthorized).
    [Arguments]    ${new_user_object}
    ${response}    POST Data    ${LOGIN_RESOURCE}    ${new_user_object}
    RETURN    ${response}
