*** Settings ***
Documentation       This resource file contains keywords for carts flow operations.

Resource            ../requests/carts/carts_requests.resource


*** Keywords ***
Get Cart Product Request Body
    [Documentation]    STEP - Get the request body for a new cart with product id and quantity.
    [Arguments]    ${id_product}    ${quantity}=${EMPTY}
    @{product_request_body}    Create Product Cart Body    ${id_product}    ${quantity}
    RETURN    ${product_request_body}

Get Cart Request Body
    [Documentation]    STEP - Get the request body for a new cart with product id and quantity.
    [Arguments]    ${cart_products_request_body}
    ${cart_request_body}    Create Carts Body    ${cart_products_request_body}
    RETURN    ${cart_request_body}

Get Registered Carts
    [Documentation]    STEP - Retrieve carts by specific query or all registered carts by user and returns response.
    [Arguments]    ${query}=${EMPTY}
    ${response}    Get Cart By Id    ${query}
    RETURN    ${response}

Register New Cart
    [Documentation]    STEP - Register a new random cart and returns response.
    [Arguments]    ${cart_request_body}    ${token}
    ${response}    Post New Cart    ${cart_request_body}    ${token}
    RETURN    ${response}

Get Registered Cart By ID
    [Documentation]    STEP - Retrieve carts by id and returns response.
    [Arguments]    ${cart_id}
    ${response}    Get Cart By Id    ${cart_id}
    RETURN    ${response}

Conclude Purchase
    [Documentation]    STEP - Delete Carts From User by user token and returns response.
    [Arguments]    ${user_token}
    ${response}    Delete Cart - Conclude Order    ${user_token}
    RETURN    ${response}

Cancel Purchase
    [Documentation]    STEP - Update carts by user token and returns response.
    [Arguments]    ${user_token}
    ${response}    Delete Cart - Cancel Order    ${user_token}
    RETURN    ${response}
