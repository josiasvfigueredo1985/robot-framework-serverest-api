*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ./test_resources/base_test_resources.resource


*** Test Cases ***
Cadastrar Carrinho Com Novo Produto Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    Register New Cart With Random Product
    Should Be Equal As Numbers    ${CARTS_NEW_CART_PRODUCT_RESPONSE.status_code}    ${CREATED_STATUS}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCT_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCT_RESPONSE.json()}    ${ID_KEY}

Cadastrar Carrinho Com Novos Produtos Aleatórios
    [Documentation]    This test case logs in with a new random user and verifies the response.
    ${qty}    Set Variable    2
    Register New Cart With Random Products    cart_products_qty=${qty}
    Should Be Equal As Numbers    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.status_code}    ${CREATED_STATUS}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}    ${ID_KEY}

Consultar Carrinho Do Usuário Cadastrados Com Produtos Aleatórios
    [Documentation]    This test case logs in with a new random user and verifies the response.
    ${qty}    Set Variable    2
    Register New Cart With Random Products    cart_products_qty=${qty}
    Should Be Equal As Numbers    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.status_code}    ${CREATED_STATUS}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    VAR    &{user_id}=     ${USER_ID_KEY}=${USERS_NEW_USER_RESPONSE.json()}[${ID_KEY}]
    Get Carts From User    query=&{user_id}
    ${productsQty}    Get Length
    ...    ${CARTS_REGISTERED_CARTS_QUERY_RESPONSE.json()}[${CART_RESOURCE}][0][${PRODUCTS_RESOURCE}]
    Should Be Equal As Integers    ${productsQty}    ${qty}

Consultar Por Id Carrinho Do Usuário Cadastrados Com Produtos Aleatórios
    [Documentation]    This test case logs in with a new random user and verifies the response.
    ${qty}    Set Variable    2
    Register New Cart With Random Products
    ...    cart_products_qty=${qty}
    ...    product_quantity=${qty}
    ...    cart_products_unity=${qty}
    Should Be Equal As Numbers    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.status_code}    ${CREATED_STATUS}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    ${cart_id}    Set Variable    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${ID_KEY}]
    Get By Id Cart From USer    id=${cart_id}
    ${productsQty}    Get Length    ${CARTS_REGISTERED_CARTS_ID_RESPONSE.json()}[${PRODUCTS_RESOURCE}]
    Should Be Equal As Integers    ${productsQty}    ${qty}
    Should Be Equal As Strings    ${CARTS_REGISTERED_CARTS_ID_RESPONSE.json()}[${ID_KEY}]    ${cart_id}
