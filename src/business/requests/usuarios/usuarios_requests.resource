*** Settings ***
Documentation       This resource file contains requests related to usuarios.

Resource            ../base/base_requests.resource


*** Variables ***
${USUARIOS_RESOURCE}    usuarios


*** Keywords ***
Get All Users
    [Documentation]    Listar usuários cadastrados
    [Arguments]    ${query}=${EMPTY}
    ${response}    GET Data    ${USUARIOS_RESOURCE}    ${query}
    RETURN    ${response}

Post New User
    [Documentation]    Cadastrar usuário
    ...    - Não é permitido cadastrar usuário com email já utilizado
    [Arguments]    ${new_user_object}
    ${response}    POST Data    ${USUARIOS_RESOURCE}    ${new_user_object}
    VAR    ${userId}    ${response.json()}[_id]
    Append ID To File    ${USUARIOS_RESOURCE}    ${userId}
    RETURN    ${response}    ${new_user_object}

Get User By Id
    [Documentation]    Buscar usuário por ID
    [Arguments]    ${id}
    ${response}    GET Data    ${USUARIOS_RESOURCE}    ${id}
    RETURN    ${response}

Delete User By Id
    [Documentation]    Excluir usuário
    ...    - Não é permitido excluir usuário com carrinho.
    [Arguments]    ${id}
    ${response}    DELETE Data    ${USUARIOS_RESOURCE}    ${id}
    RETURN    ${response}

Put User By Id
    [Documentation]    Editar usuário
    ...    - Não é permitido cadastrar usuário com email já utilizado.
    ...    - Caso não seja encontrado usuário com o ID informado é realizado novo cadastro ao invés de alteração.
    [Arguments]    ${id}    ${data}
    ${response}    PUT Data    ${USUARIOS_RESOURCE}    ${id}    ${data}
    RETURN    ${response}
