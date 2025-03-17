*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../../steps/users_steps.resource
Resource            ../../steps/login_steps.resource
Resource            ../users/users_hooks.resource


*** Keywords ***
Post Mock Login Request
    [Arguments]    ${email}    ${password}    ${status_code}    ${message}
    ${login_request_body}=    Get Login Request Body    ${email}    ${password}
    ${login_response_body}=    Get Login Response Body Success    ${message}
    IF    '${status_code}'=='401'
        ${login_response_body}=    Get Login Response Body Failure    ${message}
    END
    ${response}=    Mock Post Login    ${login_request_body}    ${login_response_body}    ${status_code}
    RETURN    ${response}
