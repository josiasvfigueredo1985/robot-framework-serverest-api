*** Settings ***
Documentation       This resource file contains base request methods for REST API interactions.

Resource            ./base_session_manager.resource


*** Keywords ***
POST Data
    [Documentation]    Sends a POST request to the specified resource with the given data.
    [Arguments]    ${resource}    ${data}
    Create API Session    ${HEADERS}
    ${response}    POST On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    ...    json=${data}
    RETURN    ${response}

POST Data Authorized    # robotcode: ignore
    [Documentation]    Sends an authorized POST request to the specified resource with the given data.
    [Arguments]    ${resource}    ${data}    ${auth_token}
    ${auth_headers}    Build Authorized Header    ${auth_token}
    Create API Session    ${auth_headers}
    ${response}    POST On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    ...    json=${data}
    RETURN    ${response}

PUT Data    # robotcode: ignore
    [Documentation]    Sends a PUT request to the specified resource with the given data.
    [Arguments]    ${resource}    ${id}    ${data}
    Create API Session    ${HEADERS}
    ${response}    PUT On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    ...    json=${data}
    RETURN    ${response}

PUT Data Authorized    # robotcode: ignore
    [Documentation]    Sends an authorized PUT request to the specified resource with the given data.
    [Arguments]    ${resource}    ${id}    ${data}    ${auth_token}
    ${auth_headers}    Build Authorized Header    ${auth_token}
    Create API Session    ${auth_headers}
    ${response}    PUT On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    ...    json=${data}
    RETURN    ${response}

DELETE By Parameter Authorized    # robotcode: ignore
    [Documentation]    Sends a DELETE request to the specified resource and parameter.
    [Arguments]    ${resource}    ${parameter}    ${auth_token}
    ${auth_headers}    Build Authorized Header    ${auth_token}
    Create API Session    ${auth_headers}
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${parameter}
    RETURN    ${response}

DELETE By Id
    [Documentation]    Sends a DELETE request to the specified resource and Id.
    [Arguments]    ${resource}    ${id}
    Create API Session    ${HEADERS}
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}

DELETE By Id Authorized
    [Documentation]    Sends an authorized DELETE request to the specified resource and Id.
    [Arguments]    ${resource}    ${id}    ${auth_token}
    ${auth_headers}    Build Authorized Header    ${auth_token}
    Create API Session    ${auth_headers}
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}

GET All    # robotcode: ignore
    [Documentation]    Sends a GET request to the specified resource.
    [Arguments]    ${resource}
    Create API Session    ${HEADERS}
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    RETURN    ${response}

GET By Query    # robotcode: ignore
    [Documentation]    Sends a GET request to the specified resource and dynamic parameter.
    [Arguments]    ${resource}    ${dynamic_parameters}
    Create API Session    ${HEADERS}
    ${query_parameters}    Build Resource With Query Parameters    ${resource}    ${dynamic_parameters}
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${query_parameters}
    RETURN    ${response}

GET By Id    # robotcode: ignore
    [Documentation]    Sends a GET request to the specified resource and Id.
    [Arguments]    ${resource}    ${id}
    Create API Session    ${HEADERS}
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}

Build Authorized Header
    [Documentation]    Builds the authorization header with the given token.
    [Arguments]    ${token}
    VAR    &{AUTH_HEADERS}    Authorization=${token}    Content-Type=${CONTENT_TYPE}
    RETURN    ${AUTH_HEADERS}
