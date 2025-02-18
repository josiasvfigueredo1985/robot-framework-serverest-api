*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../requests/usuarios/usuarios_requests.resource


*** Keywords ***
Get Registered Users
    [Documentation]    Retrieve all users
    ...    - As optional, following parameters can be used as filter:
    ...    - - _id
    ...    - - nome
    ...    - - email
    ...    - - password
    ...    - - administrador
    [Arguments]    ${query}= ${EMPTY}
    ${response}    Get All Users    ${query}
    RETURN    ${response}

Register New User
    [Documentation]    Register a new random user and return the response and random user object.
    ${randomUser}    Create New User
    ${response}    Post New User    ${randomUser}
    RETURN    ${response}    ${randomUser}

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
