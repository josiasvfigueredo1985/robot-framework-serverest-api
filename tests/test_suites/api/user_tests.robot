*** Settings ***
Resource    ../../resources/api.robot
Test Setup    Criar Sessão de API

*** Test Cases ***
Validar Listagem de Usuários
    ${response}    Fazer Requisição GET    /users
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

Criar Novo Usuário
    ${body}    Create Dictionary    name=John Doe    username=johndoe    email=john@example.com
    ${response}    Fazer Requisição POST    /users    ${body}
    Should Be Equal As Strings    ${response.status_code}    201
    Log    ${response.json()}
