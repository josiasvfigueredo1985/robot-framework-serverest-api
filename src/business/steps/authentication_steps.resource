*** Settings ***
Documentation       This resource file handles the authentication flow.

Resource            login_steps.resource


*** Keywords ***
Get Bearer Token
    [Documentation]    This keyword retrieves the bearer token by logging in with a random user.
    [Arguments]    ${newLogin}
    ${response}    Login With Random User    ${newLogin}
    RETURN    ${response.json()}[authorization]
