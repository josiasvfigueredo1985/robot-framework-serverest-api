*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com  # Exemplo de API pública

*** Keywords ***
Criar Sessão de API
    Create Session    api    ${BASE_URL}

Fazer Requisição GET
    [Arguments]    ${endpoint}
    ${response}    GET On Session    api    ${endpoint}
    RETURN    ${response}

Fazer Requisição POST
    [Arguments]    ${endpoint}    ${body}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    api    ${endpoint}    json=${body}    headers=${headers}
    RETURN    ${response}