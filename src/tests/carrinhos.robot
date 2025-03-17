*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ./test_resources/base_test_resources.resource


*** Variables ***
${QTY}      2


*** Test Cases ***
Cadastrar Carrinho Com Novo Produto Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    [Tags]    -smoke
    Register New Cart With Random Product
    Status Should Be     ${CREATED_STATUS}    ${CARTS_NEW_CART_PRODUCT_RESPONSE}   
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCT_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCT_RESPONSE.json()}    ${ID_KEY}

Cadastrar Carrinho Com Novos Produtos Aleatórios
    [Documentation]    This test case logs in with a new random user and verifies the response.
    [Tags]    -smoke
    Register New Cart With Random Products    cart_products_qty=${QTY}
    Status Should Be     ${CREATED_STATUS}    ${CARTS_NEW_CART_PRODUCTS_RESPONSE}   
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}    ${ID_KEY}

Consultar Carrinho Do Usuário Cadastrados Com Produtos Aleatórios
    [Documentation]    This test case logs in with a new random user and verifies the response.
    [Tags]    -smoke
    Register New Cart With Random Products    cart_products_qty=${QTY}
    Status Should Be     ${CREATED_STATUS}    ${CARTS_NEW_CART_PRODUCTS_RESPONSE} 
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    # robocop: off
    &{cart_user_id}    Create Dictionary
    ...    ${USER_ID_KEY}=${USERS_NEW_USER_RESPONSE.json()}[${ID_KEY}]
    Get Carts From User    query=&{cart_user_id}
    ${productsQty}    Set Variable
    ...    ${CARTS_REGISTERED_CARTS_QUERY_RESPONSE.json()}[${CART_RESOURCE}][0][quantidadeTotal]
    Should Be Equal As Integers    ${productsQty}    ${QTY}

Consultar Por Id Carrinho Do Usuário Cadastrados Com Produtos Aleatórios
    [Documentation]    This test case logs in with a new random user and verifies the response.
    [Tags]    -smoke
    ${qty_total}    Evaluate    ${QTY} * ${QTY}
    Register New Cart With Random Products
    ...    cart_products_qty=${QTY}
    ...    product_quantity=${QTY}
    ...    cart_products_unity=${QTY}
    Status Should Be     ${CREATED_STATUS}    ${CARTS_NEW_CART_PRODUCTS_RESPONSE}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    ${users_cart_id}    Set Variable    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${ID_KEY}]
    Get By Id Cart From USer    id=${users_cart_id}
    ${productsQty}    Set Variable    ${CARTS_REGISTERED_CARTS_ID_RESPONSE.json()}[quantidadeTotal]
    Should Be Equal As Integers    ${productsQty}    ${qty_total}
    Should Be Equal As Strings    ${CARTS_REGISTERED_CARTS_ID_RESPONSE.json()}[${ID_KEY}]    ${users_cart_id}
