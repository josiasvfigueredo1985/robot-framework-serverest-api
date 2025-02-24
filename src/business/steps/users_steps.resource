*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../requests/users/users_requests.resource


*** Keywords ***
Get User Request Body
    [Documentation]    Get the request body for a new user
    [Arguments]    ${is_admin}=${EMPTY}    ${email_domain}=${EMPTY}
    ${new_random_user}    Create Random User Body    ${is_admin}    ${email_domain}
    RETURN    ${new_random_user}

Register New User
    [Documentation]    Register a new random user and return the response and random user object.
    [Arguments]    ${user_body}
    ${response}    Post New User    ${user_body}
    RETURN    ${response}    ${user_body}

Get Registered User
    [Documentation]    Retrieve user by id
    [Arguments]    ${user_id}
    ${response}    Get User By Id    ${user_id}
    RETURN    ${response}

Delete Registered User
    [Documentation]    Delete user by id
    [Arguments]    ${user_id}
    ${response}    Delete User By Id    ${user_id}
    RETURN    ${response}

Update Registered USer
    [Documentation]    Update user by id
    [Arguments]    ${user_id}    ${user_body}
    ${response}    Put User By Id    ${user_id}    ${user_body}
    RETURN    ${response}
