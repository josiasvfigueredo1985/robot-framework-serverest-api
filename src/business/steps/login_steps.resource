*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../requests/login/login_requests.resource


*** Keywords ***
Login New User
    [Documentation]    STEP - Logs in with a created user and returns response.
    [Arguments]    ${login_body}
    ${response}=    Post Login    ${login_body}
    RETURN    ${response}

Get Login Request Body
    [Documentation]    STEP - Get the request body for a new user Login.
    [Arguments]    ${email}    ${password}
    ${login_request_body}=    Create Login Body    ${email}    ${password}
    RETURN    ${login_request_body}
