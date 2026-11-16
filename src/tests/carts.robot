*** Settings ***
Documentation       Tests shopping cart creation and retrieval.

Resource            ./test_resources/base_test_resources.resource


*** Variables ***
${QUANTITY}    2


*** Test Cases ***
Create Cart With One Random Product
    [Documentation]    Creates a cart with one random product and validates the response.
    [Tags]    smoke
    Register New Cart With Random Product
    Status Should Be    ${CREATED_STATUS}    ${CARTS_NEW_CART_PRODUCT_RESPONSE}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCT_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCT_RESPONSE.json()}    ${ID_KEY}

Create Cart With Multiple Random Products
    [Documentation]    Creates a cart with multiple random products and validates the response.
    [Tags]    smoke
    Register New Cart With Random Products    cart_products_qty=${QUANTITY}
    Status Should Be    ${CREATED_STATUS}    ${CARTS_NEW_CART_PRODUCTS_RESPONSE}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}    ${ID_KEY}

Retrieve Cart For Current User
    [Documentation]    Retrieves the current user's cart and checks its product quantity.
    [Tags]    smoke
    Register New Cart With Random Products    cart_products_qty=${QUANTITY}
    Status Should Be    ${CREATED_STATUS}    ${CARTS_NEW_CART_PRODUCTS_RESPONSE}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    # robocop: off
    &{cart_user_id}    Create Dictionary
    ...    ${USER_ID_KEY}=${USERS_NEW_USER_RESPONSE.json()}[${ID_KEY}]
    Get Carts From User    query=&{cart_user_id}
    ${products_quantity}=    Set Variable
    ...    ${CARTS_REGISTERED_CARTS_QUERY_RESPONSE.json()}[${CART_RESOURCE}][0][${CART_TOTAL_QTY_KEY}]
    Should Be Equal As Integers    ${products_quantity}    ${QUANTITY}

Retrieve Cart By ID For Current User
    [Documentation]    Retrieves a cart by ID and validates its total product quantity.
    [Tags]    smoke
    ${total_quantity}=    Evaluate    ${QUANTITY} * ${QUANTITY}
    Register New Cart With Random Products
    ...    cart_products_qty=${QUANTITY}
    ...    product_quantity=${QUANTITY}
    ...    cart_products_unity=${QUANTITY}
    Status Should Be    ${CREATED_STATUS}    ${CARTS_NEW_CART_PRODUCTS_RESPONSE}
    Should Be Equal As Strings
    ...    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${MESSAGE_KEY}]
    ...    ${SUCCESS_CREATED_MESSAGE}
    ${user_cart_id}=    Set Variable    ${CARTS_NEW_CART_PRODUCTS_RESPONSE.json()}[${ID_KEY}]
    Get Cart By ID From User    id=${user_cart_id}
    ${products_quantity}=    Set Variable    ${CARTS_REGISTERED_CARTS_ID_RESPONSE.json()}[${CART_TOTAL_QTY_KEY}]
    Should Be Equal As Integers    ${products_quantity}    ${total_quantity}
    Should Be Equal As Strings    ${CARTS_REGISTERED_CARTS_ID_RESPONSE.json()}[${ID_KEY}]    ${user_cart_id}
