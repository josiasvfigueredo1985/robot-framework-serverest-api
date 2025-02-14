*** Settings ***
Documentation       This resource file handles the authentication flow.

Resource            ../../../business/hooks/login/login_hooks.resource


*** Keywords ***
Get Bearer Token
    [Documentation]    This keyword retrieves the bearer token by logging in with a random user.
    ${response}    Login With New Random User
    RETURN    ${response.json()}[authorization]
