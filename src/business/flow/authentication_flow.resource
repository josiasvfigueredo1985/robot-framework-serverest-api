*** Settings ***
Documentation       This resource file handles the authentication flow.

Resource            login_flow.resource


*** Keywords ***
Get Bearer Token
    [Documentation]    This keyword retrieves the bearer token by logging in with a random user.
    ${response}    Login Com Usuário Aleatório
    RETURN    ${response.json()}[authorization]
