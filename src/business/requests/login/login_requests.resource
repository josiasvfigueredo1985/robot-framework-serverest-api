*** Settings ***
Documentation       Login - Authenticate your user to create a cart and, if you are an administrator, manage products

Resource            ../users/users_requests.resource


*** Variables ***
${LOGIN_RESOURCE}=          login
${LOGIN_BEARER_TOKEN}=      ${EMPTY}


*** Keywords ***
Post Login
    [Documentation]    Post /login - Login
    ...    - The duration of the token returned in authorization is 600 seconds (10 minutes).
    ...    If it has expired, you will receive status code 401 (Unauthorized).
    [Arguments]    ${login_request_body}
    ${response}    POST Data    ${LOGIN_RESOURCE}    ${login_request_body}
    Set Suite Variable    ${LOGIN_BEARER_TOKEN}    ${response.json()}[authorization]
    Append ID To File    ${LOGIN_RESOURCE}    id=${LOGIN_BEARER_TOKEN}
    RETURN    ${response}
