*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ../framework/base/base_test_resources.resource


*** Test Cases ***
Cadastrar Carrinho Com Novo Produto Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    Register New Cart With Random Product
    Should Be Equal As Numbers    ${CARTS_NEW_CART_PRODUCT_RESPONSE.status_code}    201
    Should Be Equal As Strings    ${CARTS_NEW_CART_PRODUCT_RESPONSE.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCT_RESPONSE.json()}    _id

Cadastrar Carrinho Com Novos Produtos Aleatórios
    [Documentation]    This test case logs in with a new random user and verifies the response.
    VAR    ${qty}=    2
    Register New Cart With Random Products    cart_products_qty=${qty}
    Should Be Equal As Numbers    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.status_code}    201
    Should Be Equal As Strings    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}    _id

Consultar Carrinho Do Usuário Cadastrados Com Produtos Aleatórios
    [Documentation]    This test case logs in with a new random user and verifies the response.
    VAR    ${qty}=    2
    Register New Cart With Random Products    cart_products_qty=${qty}
    Should Be Equal As Numbers    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.status_code}    201
    Should Be Equal As Strings    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}    _id
    &{user_id}    Create Dictionary    idUsuario=${USERS_NEW_USER_RESPONSE.json()}[_id]
    Get Carts From User    query=&{user_id}
    ${productsQty}    Get Length    ${CARTS_REGISTERED_CARTS_QUERY_RESPONSE.json()}[carrinhos][0][produtos]
    Should Be Equal As Integers    ${productsQty}    ${qty}
