*** Settings ***
Documentation       This resource file contains keywords for carts operations.

Resource            ../../steps/carts_steps.resource
Resource            ../products/products_hooks.resource
Library             ../../../framework/utils/StringUtils.py


*** Variables ***
${CARTS_NEW_CART_PRODUCT_RESPONSE}          ${EMPTY}
${CARTS_NEW_CART_REQUEST_BODY}              ${EMPTY}
${CARTS_NEW_CART_PRODUCTS_RESPONSE}         ${EMPTY}
${CARTS_NEW_CART_PRODUCTS_REQUEST_BODY}     ${EMPTY}
${CARTS_REGISTERED_CARTS_ID_RESPONSE}       ${EMPTY}
${CARTS_REGISTERED_CARTS_QUERY_RESPONSE}    ${EMPTY}


*** Keywords ***
Register New Cart With Random Product
    [Documentation]    HOOKS - Register a new cart
    ...    and sets suite variables CARTS_NEW_CART_PRODUCT_RESPONSE
    ...    and CARTS_NEW_CART_REQUEST_BODY.
    [Arguments]    ${price}=${EMPTY}    ${product_quantity}=${EMPTY}    ${cart_products_unity}=${EMPTY}
    Register New Random Product    ${price}    ${product_quantity}
    ${check_cart_product_unity}    Is Empty String    ${cart_products_unity}
    IF    ${check_cart_product_unity}
        VAR    ${cart_products_unity}=    ${PRODUCTS_NEW_PRODUCT_REQUEST_BODY}[quantidade]
    END
    ${cart_product_request_body}    Get Cart Product Request Body
    ...    ${PRODUCTS_NEW_PRODUCT_RESPONSE.json()}[_id]
    ...    ${cart_products_unity}
    ${cart_request_body}    Get Cart Request Body    ${cart_product_request_body}
    ${response_cart}    Register New Cart    ${cart_request_body}    ${LOGIN_BEARER_TOKEN}
    Set Suite Variable    ${CARTS_NEW_CART_REQUEST_BODY}    ${cart_request_body}
    Set Suite Variable    ${CARTS_NEW_CART_PRODUCT_RESPONSE}    ${response_cart}

Register New Cart With Random Products
    [Documentation]    HOOKS - Creates a new cart with given products quantity
    ...    and sets suite variables CARTS_NEW_CART_PRODUCT_RESPONSE
    ...    and CARTS_NEW_CART_REQUEST_BODY
    [Arguments]
    ...    ${price}=${EMPTY}
    ...    ${product_quantity}=${EMPTY}
    ...    ${cart_products_qty}=${EMPTY}
    ...    ${cart_products_unity}=${EMPTY}
    VAR    @{cart_products_ids}    @{EMPTY}
    VAR    ${count_start}    1
    ${check_cart_product}    Is Empty String    ${cart_products_qty}
    IF    ${check_cart_product}
        VAR    ${cart_products_qty}=    1
    END
    ${check_cart_product_unity}    Is Empty String    ${cart_products_unity}

    WHILE    ${count_start} <= ${cart_products_qty}
        Register New Random Product    ${price}    ${product_quantity}
        IF    ${check_cart_product_unity}
            VAR    ${cart_products_unity}=    ${PRODUCTS_NEW_PRODUCT_REQUEST_BODY}[quantidade]
        END
        Append To List    ${cart_products_ids}    ${PRODUCTS_NEW_PRODUCT_RESPONSE.json()}[_id]
        ${count_start}    Evaluate    ${count_start} + 1
    END
    ${cart_product_request_body}    Get Cart Product Request Body    ${cart_products_ids}    ${cart_products_unity}
    ${cart_request_body}    Get Cart Request Body    ${cart_product_request_body}
    ${response_cart}    Register New Cart    ${cart_request_body}    ${LOGIN_BEARER_TOKEN}
    Set Suite Variable    ${CARTS_NEW_CART_PRODUCTS_REQUEST_BODY}    ${cart_request_body}
    Set Suite Variable    ${CARTS_NEW_CART_PRODUCTS_RESPONSE}    ${response_cart}

Get By Id Cart From USer
    [Documentation]    HOOKS - Retrieves data from a user's cart by id
    ...    registered by user given cart id
    ...    and sets suite variable CARTS_REGISTERED_CARTS_ID_RESPONSE.
    [Arguments]    ${id}
    ${response}    Get Registered Cart By ID    ${id}
    Set Suite Variable    ${CARTS_REGISTERED_CARTS_ID_RESPONSE}    ${response}

Get Carts From User
    [Documentation]    HOOKS - Retrieves data from current user's cart
    ...    registered by user given optional query
    ...    and sets suite variable CARTS_REGISTERED_CARTS_QUERY_RESPONSE.
    [Arguments]    ${query}=${EMPTY}
    ${response}    Get Registered Carts    ${query}
    Set Suite Variable    ${CARTS_REGISTERED_CARTS_QUERY_RESPONSE}    ${response}

Validate Carts Response Schema
    [Documentation]    HOOKS - Validate response by schema file.
    [Arguments]    ${response}    ${request_method}
    Validate Response By Schema File    ${response}    ${CART_RESOURCE}    ${request_method}
