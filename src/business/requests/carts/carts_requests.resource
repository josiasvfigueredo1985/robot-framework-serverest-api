*** Settings ***
Documentation       Carts - Check the registered shopping carts, create one for your user and, in the end,
...                 give up on the purchase because you were just taking a look

Resource            ../base/base_requests.resource
Resource            ../../../framework/base/base_data_manager_resources.resource


*** Variables ***
${CART_RESOURCE}=       carrinhos
${CHECK-OUT}=           concluir-compra
${CANCEL_PURCHASE}=     cancelar-compra


*** Keywords ***
Get All Carts
    [Documentation]    GET /carts - List registered carts
    ...    - Returned carts are unique per user
    [Arguments]    ${query}=${EMPTY}
    ${response}    GET Data    ${CART_RESOURCE}    ${query}
    RETURN    ${response}

Post New Cart
    [Documentation]    POST /carts - Register cart
    ...    - The cart is linked to the user of the token sent in the header Authorization, and only 1 cart can
    ...    be registered per user.
    ...    - When a cart is successfully registered, the quantity in the registration of each product inserted
    ...    in the cart is reduced.
    ...    - returns ${response}    and    ${cart_request_body}.
    [Arguments]    ${cart_request_body}    ${token}
    ${response}    POST Data    ${CART_RESOURCE}    ${cart_request_body}    ${token}
    VAR    ${user_id}    ${response.json()}[_id]
    Append ID To File    ${CART_RESOURCE}    ${user_id}
    RETURN    ${response}

Get Cart By ID
    [Documentation]    GET /carts /{_id} - Search cart by ID
    [Arguments]    ${id}
    ${response}    GET Data    ${CART_RESOURCE}    ${id}
    RETURN    ${response}

Delete Cart - Conclude Order
    [Documentation]    DELETE /carts /checkout - Delete Cart
    ...    - When completing a purchase, the cart is deleted.
    ...    - The deleted cart will be the one linked to the user token used.
    [Arguments]    ${token}
    ${response}    DELETE Data    ${CART_RESOURCE}    ${CHECK-OUT}    ${token}
    RETURN    ${response}

Delete Cart - Cancel Order
    [Documentation]    DELETE /carts /cancel-purchase - Delete cart and return products to stock
    ...    - When you cancel a purchase, the cart is deleted and the stock of the products in that cart is replenished.
    ...    - The deleted cart will be the one linked to the user who token used it.
    [Arguments]    ${token}
    ${response}    DELETE Data    ${CART_RESOURCE}    ${CANCEL_PURCHASE}    ${token}
    RETURN    ${response}
