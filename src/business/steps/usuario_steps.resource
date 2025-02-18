*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../requests/usuarios/usuarios_requests.resource


*** Keywords ***
Get User Request Body
    [Documentation]    Get the request body for a new user
    [Arguments]    ${isAdmin}=${EMPTY}    ${emailDomain}=${EMPTY}
    ${new_random_user}    Create Random User Body    isAdmin=${isAdmin}    emailDomain=${emailDomain}
    RETURN     ${new_random_user}

Register New User
    [Documentation]    Register a new random user and return the response and random user object.
    [Arguments]    ${userBody}
    ${response}    Post New User    ${userBody}
    RETURN    ${response}    ${userBody}

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
    [Arguments]    ${user_id}    ${data}
    ${response}    Put User By Id    ${user_id}    ${data}
    RETURN    ${response}
