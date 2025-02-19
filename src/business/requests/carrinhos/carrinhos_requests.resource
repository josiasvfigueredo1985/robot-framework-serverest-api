*** Settings ***
Documentation       This resource file contains requests related to carrinhos.

Resource            ../base/base_requests.resource


*** Variables ***
${CARRINHOS_RESOURCE}=      carrinhos
${CONCLUIR_COMPRA}=         concluir-compra
${CANCELAR_COMPRA}=         cancelar-compra


*** Keywords ***
Get All Carts
    [Documentation]    Listar carrinhos cadastrados
    ...    - Os carrinhos retornados são únicos por usuário
    [Arguments]    ${query}=${EMPTY}
    ${response}    GET Data    ${CARRINHOS_RESOURCE}    ${query}
    RETURN    ${response}

Post New Cart
    [Documentation]    Cadastrar carrinho
    ...    - O carrinho é vinculado ao usuário do token enviado no header Authorization, sendo possível cadastrar
    ...    apenas 1 carrinho por usuário.
    ...    - Ao cadastrar carrinho com sucesso é feita a redução da quantidade no cadastro de cada produto inserido
    ...    no carrinho.
    [Arguments]    ${new_cart_object}    ${token}
    ${response}    POST Data    ${CARRINHOS_RESOURCE}    ${new_cart_object}    ${token}
    VAR    ${userId}    ${response.json()}[_id]
    Append ID To File    ${CARRINHOS_RESOURCE}    ${userId}
    RETURN    ${response}    ${new_cart_object}

Get Cart By Id
    [Documentation]    Buscar carrinho por ID
    [Arguments]    ${id}
    ${response}    GET Data    ${CARRINHOS_RESOURCE}    ${id}
    RETURN    ${response}

Delete Cart - Conclude Order
    [Documentation]    Excluir carrinho
    ...    - Ao concluir uma compra o carrinho é excluído.
    ...    - O carrinho excluído será o vinculado ao usuário do token utilizado.
    [Arguments]    ${token}
    ${response}    DELETE Data    ${CARRINHOS_RESOURCE}    ${CONCLUIR_COMPRA}    ${token}
    RETURN    ${response}

Delete Cart - Cancel Order
    [Documentation]    Excluir carrinho e retornar produtos para estoque
    ...    - Ao cancelar uma compra o carrinho é excluído e o estoque dos produtos desse carrinho é reabastecido.
    ...    - O carrinho excluído será o vinculado ao usuário do token utilizado.
    [Arguments]    ${token}
    ${response}    DELETE Data    ${CARRINHOS_RESOURCE}    ${CANCELAR_COMPRA}    ${token}
    RETURN    ${response}
