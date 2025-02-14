*** Settings ***
Documentation       This resource file contains base request methods for REST API interactions.

Resource            ./base_session_manager.resource


*** Keywords ***
POST Data
    [Documentation]    Sends a POST request to the specified resource with the given data.
    [Arguments]    ${resource}    ${data}    ${auth_token}=${EMPTY}
    IF    '${auth_token}' != '${EMPTY}'
        ${auth_headers}    Build Authorized Header    ${auth_token}
        Create API Session    ${auth_headers}
    ELSE
        Create API Session    ${HEADERS}
    END
    ${response}    POST On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    ...    json=${data}
    RETURN    ${response}

PUT Data    # robotcode: ignore
    [Documentation]    Sends a PUT request to the specified resource with the given data.
    [Arguments]    ${resource}    ${parameter}    ${data}    ${auth_token}=${EMPTY}
    IF    '${auth_token}' != '${EMPTY}'
        ${auth_headers}    Build Authorized Header    ${auth_token}
        Create API Session    ${auth_headers}
    ELSE
        Create API Session    ${HEADERS}
    END
    ${url_path}    Build Resource With Query Parameters    ${resource}    ${parameter}
    ${response}    PUT On Session
    ...    ${SESSION_NAME}
    ...    ${url_path}
    ...    json=${data}
    RETURN    ${response}

DELETE Data    # robotcode: ignore
    [Documentation]    Sends a DELETE request to the specified resource and parameter.
    [Arguments]    ${resource}    ${parameter}    ${auth_token}=${EMPTY}
    IF    '${auth_token}' != '${EMPTY}'
        ${auth_headers}    Build Authorized Header    ${auth_token}
        Create API Session    ${auth_headers}
    ELSE
        Create API Session    ${HEADERS}
    END
    ${url_path}    Build Resource With Query Parameters    ${resource}    ${parameter}
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${url_path}
    RETURN    ${response}

GET Data    # robotcode: ignore
    [Documentation]    Sends a GET request to the specified resource with or without ID or query.
    [Arguments]    ${resource}    ${dynamic_parameters}=${EMPTY}
    Create API Session    ${HEADERS}
    ${url_path}    Build Resource With Query Parameters    ${resource}    ${dynamic_parameters}
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${url_path}
    RETURN    ${response}

Build Authorized Header
    [Documentation]    Builds the authorization header with the given token.
    [Arguments]    ${token}
    VAR    &{AUTH_HEADERS}    Authorization=${token}    Content-Type=${CONTENT_TYPE}
    RETURN    ${AUTH_HEADERS}
