*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../requests/usuarios/usuarios_requests.resource


*** Keywords ***
Register Random User
    [Documentation]    Register a new random user and return the response and random user object.
    ${randomUser}    Create New User
    ${response}    Post New User    ${randomUser}
    RETURN    ${response}    ${randomUser}
