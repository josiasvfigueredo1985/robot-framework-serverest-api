*** Settings ***
Documentation       This resource file contains base request methods for REST API interactions.

Resource            ./base_session_manager.resource
Library             Collections


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
    TRY
        ${response}    Wait Until Keyword Succeeds    5s    1s    POST On Session
        ...    ${SESSION_NAME}
        ...    ${resource}
        ...    json=${data}
        RETURN    ${response}
    EXCEPT    Error
        Log    Error while sending Post request. \n
        ...    Details: \n
        ...    Resource: \n ${response}
        ...    Request Body: \n ${data}
    END

PUT Data
    [Documentation]    Sends a PUT request to the specified resource with the given data.
    [Arguments]    ${resource}    ${parameter}    ${data}    ${auth_token}=${EMPTY}
    IF    '${auth_token}' != '${EMPTY}'
        ${auth_headers}    Build Authorized Header    ${auth_token}
        Create API Session    ${auth_headers}
    ELSE
        Create API Session    ${HEADERS}
    END
    ${url_path}    Build Resource With Query Parameters    ${resource}    ${parameter}
    ${response}    Wait Until Keyword Succeeds    5s    1s    PUT On Session
    ...    ${SESSION_NAME}
    ...    ${url_path}
    ...    json=${data}
    RETURN    ${response}

DELETE Data
    [Documentation]    Sends a DELETE request to the specified resource and parameter.
    [Arguments]    ${resource}    ${parameter}    ${auth_token}=${EMPTY}
    IF    '${auth_token}' != '${EMPTY}'
        ${auth_headers}    Build Authorized Header    ${auth_token}    idDeleteMethod=True
        Create API Session    ${auth_headers}
    ELSE
        Create API Session    ${HEADERS}
    END
    ${url_path}    Build Resource With Query Parameters    ${resource}    ${parameter}
    ${response}    Wait Until Keyword Succeeds    5s    1s    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${url_path}
    RETURN    ${response}

GET Data
    [Documentation]    Sends a GET request to the specified resource with or without ID or query.
    [Arguments]    ${resource}    ${dynamic_parameters}=${EMPTY}
    Create API Session    ${HEADERS}
    ${url_path}    Build Resource With Query Parameters    ${resource}    ${dynamic_parameters}
    ${response}    Wait Until Keyword Succeeds    5s    1s    GET On Session
    ...    ${SESSION_NAME}
    ...    ${url_path}
    RETURN    ${response}

Build Authorized Header
    [Documentation]    Builds the authorization header with the given token.
    [Arguments]    ${token}    ${idDeleteMethod}=False
    &{AUTH_HEADERS}    Create Dictionary    Authorization=${token}
    VAR    ${CONTENT_TYPE}=    application/json
    IF    $idDeleteMethod
        Set To Dictionary    ${AUTH_HEADERS}    accept=${CONTENT_TYPE}
    ELSE
        Set To Dictionary    ${AUTH_HEADERS}    Content-Type=${CONTENT_TYPE}
    END
    RETURN    ${AUTH_HEADERS}
