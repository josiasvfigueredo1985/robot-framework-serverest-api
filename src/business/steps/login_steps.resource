*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../requests/login/login_requests.resource


*** Keywords ***
Login New User
    [Documentation]    Logs in with a created user.
    [Arguments]    ${data}
    ${response}    Post Login    ${data}
    RETURN    ${response}

Get Login Request Body
    [Documentation]    Get the request body for a new user Login
    [Arguments]    ${email}    ${password}
    ${new_login_user}    Create Login Body    ${email}    ${password}
    RETURN    ${new_login_user}
