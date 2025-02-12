*** Settings ***
Documentation       This resource file contains base request methods for REST API interactions.

Resource            ./base_rest.resource
Library             ../utils/RestApiUtils.py


*** Keywords ***
POST Data
    [Documentation]    Sends a POST request to the specified resource with the given data.
    [Arguments]    ${resource}    ${data}
    Start Session
    ${response}    POST On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    ...    json=${data}
    RETURN    ${response}

POST Data Authorized
    [Documentation]    Sends an authorized POST request to the specified resource with the given data.
    [Arguments]    ${resource}    ${data}    ${AUTH_TOKEN}
    Start Authenticated Session    ${AUTH_TOKEN}
    ${response}    POST On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    ...    json=${data}
    RETURN    ${response}

PUT Data
    [Documentation]    Sends a PUT request to the specified resource with the given data.
    [Arguments]    ${resource}    ${id}    ${data}
    Start Session
    ${response}    PUT On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    ...    json=${data}
    RETURN    ${response}

PUT Data Authorized
    [Documentation]    Sends an authorized PUT request to the specified resource with the given data.
    [Arguments]    ${resource}    ${id}    ${data}    ${AUTH_TOKEN}
    Start Authenticated Session    ${AUTH_TOKEN}
    ${response}    PUT On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    ...    json=${data}
    RETURN    ${response}

DELETE By Parameter Authorized
    [Documentation]    Sends a DELETE request to the specified resource and parameter.
    [Arguments]    ${resource}    ${parameter}
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${parameter}
    RETURN    ${response}

DELETE By Id
    [Documentation]    Sends a DELETE request to the specified resource and Id.
    [Arguments]    ${resource}    ${id}
    Start Session
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}

DELETE By Id Authorized
    [Documentation]    Sends an authorized DELETE request to the specified resource and Id.
    [Arguments]    ${resource}    ${id}    ${AUTH_TOKEN}
    Start Authenticated Session    ${AUTH_TOKEN}
    ${response}    DELETE On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}

GET All
    [Documentation]    Sends a GET request to the specified resource.
    [Arguments]    ${resource}
    Start Session
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${resource}
    RETURN    ${response}

GET By Query
    [Documentation]    Sends a GET request to the specified resource and dynamic parameter.
    [Arguments]    ${resource}    ${dynamic_parameters}
    Start Session
    ${query_parameters}    Build Resource With Query Parameters    ${resource}    ${dynamic_parameters}
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${query_parameters}
    RETURN    ${response}

GET By Id
    [Documentation]    Sends a GET request to the specified resource and Id.
    [Arguments]    ${resource}    ${id}
    Start Session
    ${response}    GET On Session
    ...    ${SESSION_NAME}
    ...    ${resource}/${id}
    RETURN    ${response}
