*** Settings ***
Documentation       Login - Authenticate your user to create a cart and, if you are an administrator, manage products

Resource            ../users/users_requests.resource


*** Variables ***
${LOGIN_RESOURCE}=      login


*** Keywords ***
Post Login
    [Documentation]    Post /login - Login
    ...    - The duration of the token returned in authorization is 600 seconds (10 minutes).
    ...    If it has expired, you will receive status code 401 (Unauthorized).
    [Arguments]    ${new_user_object}
    ${response}    POST Data    ${LOGIN_RESOURCE}    ${new_user_object}
    Append ID To File    ${LOGIN_RESOURCE}    id=${response.json()}[authorization]
    RETURN    ${response}
