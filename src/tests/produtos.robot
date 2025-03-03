*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ../framework/base/base_test_resources.resource


*** Test Cases ***
Cadastrar Novo Produto Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    Register New Random Product
    Should Be Equal As Numbers    ${PRODUCTS_NEW_PRODUCT_RESPONSE.status_code}    201
    Should Be Equal As Strings    ${PRODUCTS_NEW_PRODUCT_RESPONSE.json()}[message]    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${PRODUCTS_NEW_PRODUCT_RESPONSE.json()}    _id
