*** Settings ***
Documentation       Users - Manage users, view login details and register administrators

Resource            ../base/base_requests.resource


*** Variables ***
${USERS_RESOURCE}       usuarios


*** Keywords ***
Get All Users
    [Documentation]    GET /users - List registered users
    [Arguments]    ${query}=${EMPTY}
    ${response}    GET Data    ${USERS_RESOURCE}    ${query}
    RETURN    ${response}

Post New User
    [Documentation]    POST /users - Register user
    ...    - It is not allowed to register a user with an email already used.
    [Arguments]    ${new_user_object}
    ${response}    POST Data    ${USERS_RESOURCE}    ${new_user_object}
    VAR    ${userId}    ${response.json()}[_id]
    Append ID To File    ${USERS_RESOURCE}    ${userId}
    RETURN    ${response}    ${new_user_object}

Get User By Id
    [Documentation]    GET /users /{_id} - Search user by ID
    [Arguments]    ${id}
    ${response}    GET Data    ${USERS_RESOURCE}    ${id}
    RETURN    ${response}

Delete User By Id
    [Documentation]    DELETE/users /{_id} - Delete user
    ...    - It is not allowed to delete user with cart.
    [Arguments]    ${id}
    ${response}    DELETE Data    ${USERS_RESOURCE}    ${id}
    RETURN    ${response}

Put User By Id
    [Documentation]    PUT/users /{_id} - Edit user
    ...    - It is not permitted to register a user with an email address that has already been used.
    ...    - If a user with the provided ID is not found, a new registration will be performed instead of changing it.
    [Arguments]    ${id}    ${data}
    ${response}    PUT Data    ${USERS_RESOURCE}    ${id}    ${data}
    RETURN    ${response}
