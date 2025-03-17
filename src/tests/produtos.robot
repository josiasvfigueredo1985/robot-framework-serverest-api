*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ./test_resources/base_test_resources.resource


*** Test Cases ***
Cadastrar Novo Produto Aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    [Tags]    -smoke
    Register New Random Product
    Status Should Be    ${CREATED_STATUS}      ${PRODUCTS_NEW_PRODUCT_RESPONSE}  
    Should Be Equal As Strings    ${PRODUCTS_NEW_PRODUCT_RESPONSE.json()}[${MESSAGE_KEY}]    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${PRODUCTS_NEW_PRODUCT_RESPONSE.json()}    ${ID_KEY}
