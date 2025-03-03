*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../requests/users/users_requests.resource


*** Keywords ***
Get User Request Body
    [Documentation]    STEP - Get the request body for a new user
    [Arguments]    ${is_admin}=${EMPTY}    ${email_domain}=${EMPTY}
    ${user_request_body}    Create Random User Body    ${is_admin}    ${email_domain}
    RETURN    ${user_request_body}

Register New User
    [Documentation]    STEP - Register a new random user    and returns response.
    [Arguments]    ${user_request_body}
    ${response_user}    Post New User    ${user_request_body}
    RETURN    ${response_user}

Get Registered User
    [Documentation]    STEP - Retrieve user by id    and returns response.
    [Arguments]    ${user_id}
    ${response}    Get User By Id    ${user_id}
    RETURN    ${response}

Delete Registered User
    [Documentation]    STEP - Delete user by id    and returns response.
    [Arguments]    ${user_id}
    ${response}    Delete User By Id    ${user_id}
    RETURN    ${response}

Update Registered USer
    [Documentation]    STEP - Update user by id    and returns response.
    [Arguments]    ${user_id}    ${user_request_body}
    ${response}    Put User By Id    ${user_id}    ${user_request_body}
    RETURN    ${response}
