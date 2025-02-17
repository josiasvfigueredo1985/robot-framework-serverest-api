*** Settings ***
Documentation       This resource file contains requests related to usuarios.

Resource            ../base/base_requests.resource


*** Variables ***
${USUARIOS_RESOURCE}=       usuarios


*** Keywords ***
Register New User
    [Documentation]    Register a new random user and return the response and random user object.
    [Arguments]    ${new_user_object}
    ${response}    POST Data    ${USUARIOS_RESOURCE}    ${new_user_object}
    VAR    ${userId}    ${response.json()}[_id]
    Append ID To File    ${USUARIOS_RESOURCE}    ${userId}
    RETURN    ${response}    ${new_user_object}
