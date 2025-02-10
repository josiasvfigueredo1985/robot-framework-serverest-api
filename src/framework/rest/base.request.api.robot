*** Settings ***
Resource    ../base/base.resources.resource


*** Keywords ***
POST Data
    [Arguments]    ${resource}    ${data}
    Start Session
    ${response}    POST On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    ...    json=${data}
    RETURN    ${response}

POST Data Authorized
    [Arguments]    ${resource}    ${data}
    Start Authenticated Session
    ${response}    POST On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    ...    json=${data}
    RETURN    ${response}

PUT Data
    [Arguments]    ${resource}    ${id}    ${data}
    Start Session
    ${response}    PUT On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    ...    json=${data}
    RETURN    ${response}

PUT Data Authorized
    [Arguments]    ${resource}    ${id}    ${data}
    Start Authenticated Session
    ${response}    PUT On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    ...    json=${data}
    RETURN    ${response}

DELETE By Parameter Authorized
    [Arguments]    ${resource}    ${parameter}
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${parameter}
    RETURN    ${response}

DELETE By Id
    [Arguments]    ${resource}    ${id}
    Start Session
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}

DELETE By Id Authorized
    [Arguments]    ${resource}    ${id}
    Start Authenticated Session
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}

GET All
    [Arguments]    ${resource}
    Start Session
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    RETURN    ${response}

GET By Query
    [Arguments]    ${resource}    ${dinamicParameters}
    Start Session
    ${queryParameters}    Build Resource With Query Parameters    ${resource}    ${dinamicParameters}
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${queryParameters}
    RETURN    ${response}

GET By Id
    [Arguments]    ${resource}    ${id}
    Start Session
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}
