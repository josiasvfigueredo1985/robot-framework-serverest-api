*** Settings ***
Documentation       This resource file contains requests related to usuarios.

Resource            ../base/base_requests.resource


*** Keywords ***
Register New User
    [Documentation]    Register a new random user and return the response and random user object.
    [Arguments]    ${new_user_object}
    ${response}    POST Data    /usuarios    ${new_user_object}
    RETURN    ${response}    ${new_user_object}
