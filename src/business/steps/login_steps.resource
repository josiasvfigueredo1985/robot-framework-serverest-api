*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../requests/login/login_requests.resource
Library             FakerLibrary
Library             business.factories.login_factory.LoginFactory


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

Get Login Response Body Success
    [Arguments]    ${message}
    ${fake_token}=    FakerLibrary.Password    length=185
    VAR    &{login_response}=    message=${message}    authorization=Bearer ${fake_token}
    RETURN    ${login_response}

Get Login Response Body Failure
    [Arguments]    ${message}
    VAR    &{login_response}=    message=${message}
    RETURN    ${login_response}
