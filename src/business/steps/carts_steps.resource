*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../requests/carts/carts_requests.resource


*** Keywords ***
Get Cart Product Request Body
    [Documentation]    Get the request body for a new cart with product id and quantity
    [Arguments]    ${id_product}    ${quantity}
    @{new_product_cart_body}    Create Product Cart Body    ${id_product}    ${quantity}
    RETURN    ${new_product_cart_body}

Get Cart Request Body
    [Documentation]    Get the request body for a new cart with product id and quantity
    [Arguments]    ${products}
    ${new_cart_body}    Create Carts Body    ${products}
    RETURN    ${new_cart_body}

Register New Cart
    [Documentation]    Register a new random cart and return the response and random cart object.
    [Arguments]    ${cart_body}    ${token}
    ${response}    Post New Cart    ${cart_body}    ${token}
    RETURN    ${response}    ${cart_body}

Get Registered Cart
    [Documentation]    Retrieve user by id
    [Arguments]    ${cart_id}
    ${response}    Get Cart By Id    ${cart_id}
    RETURN    ${response}

Conclude Purchase
    [Documentation]    Delete user by id
    [Arguments]    ${user_token}
    ${response}    Delete Cart - Conclude Order    ${user_token}
    RETURN    ${response}

Cancel Purchase
    [Documentation]    Update user by id
    [Arguments]    ${user_token}
    ${response}    Delete Cart - Cancel Order    ${user_token}
    RETURN    ${response}
