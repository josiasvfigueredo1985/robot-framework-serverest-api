*** Settings ***
Documentation       This resource file contains requests related to produtos.

Resource            ../base/base_requests.resource


*** Variables ***
${PRODUTOS_RESOURCE}    produtos


*** Keywords ***
Get All Products
    [Documentation]    Listar produtos cadastrados
    [Arguments]    ${query}=${EMPTY}
    ${response}    GET Data    ${PRODUTOS_RESOURCE}    ${query}
    RETURN    ${response}

Post New Product
    [Documentation]    Cadastrar produto
    ...    - Não é permitido cadastrar produto com nome já utilizado
    [Arguments]    ${new_product_object}    ${token}
    ${response}    POST Data    ${PRODUTOS_RESOURCE}    ${new_product_object}    ${token}
    VAR    ${userId}    ${response.json()}[_id]
    Append ID To File    ${PRODUTOS_RESOURCE}    ${userId}
    RETURN    ${response}    ${new_product_object}

Get Product By Id
    [Documentation]    Buscar produto por ID
    [Arguments]    ${id}
    ${response}    GET Data    ${PRODUTOS_RESOURCE}    ${id}
    RETURN    ${response}

Delete Product By Id
    [Documentation]    Excluir produto
    ...    - Não é permitido excluir produto que faz parte de carrinho.
    [Arguments]    ${id}    ${token}
    ${response}    DELETE Data    ${PRODUTOS_RESOURCE}    ${id}    ${token}
    RETURN    ${response}

Put Product By Id
    [Documentation]    Editar produto
    ...    - Não é permitido cadastrar produto com nome já utilizado.
    ...    - Caso não seja encontrado usuário com o ID informado é realizado novo cadastro ao invés de alteração.
    [Arguments]    ${id}    ${data}    ${token}
    ${response}    PUT Data    ${PRODUTOS_RESOURCE}    ${id}    ${data}    ${token}
    RETURN    ${response}
