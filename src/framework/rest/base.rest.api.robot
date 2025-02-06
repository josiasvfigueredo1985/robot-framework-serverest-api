*** Settings ***
Resource    ../../business/bases/base.resources.resource


*** Keywords ***
POST Data
    [Arguments]    ${resource}    ${data}
    ${response}    POST On Session    serverest    ${resource}    json=${data}
    RETURN    ${response}

PUT Data
    [Arguments]    ${resource}    ${id}    ${data}
    ${response}    PUT On Session    serverest    ${resource}/${id}    json=${data}
    RETURN    ${response}

DELETE By Parameter
    [Arguments]    ${resource}    ${parameter}
    ${response}    DELETE On Session    serverest    ${resource}/${parameter}
    RETURN    ${response}

DELETE By Id
    [Arguments]    ${resource}    ${id}
    ${response}    DELETE On Session    serverest    ${resource}/${id}
    RETURN    ${response}

GET All
    [Arguments]    ${resource}    
    ${response}    GET On Session    serverest    ${resource}
    RETURN    ${response}

GET By Query
    [Arguments]    ${resource}    ${dinamicParameters}
    ${queryParameters}=       Build Resource With Query Parameters   ${resource}     ${dinamicParameters}
    ${response}    GET On Session    serverest    ${queryParameters}
    RETURN    ${response}

GET By Id
    [Arguments]    ${resource}    ${id}
    ${response}    GET On Session    serverest    ${resource}/${id}
    RETURN    ${response}

