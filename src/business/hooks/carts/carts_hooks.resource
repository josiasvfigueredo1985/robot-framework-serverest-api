*** Settings ***
Documentation       This resource file contains keywords for carts operations.

Resource            ../../../business/steps/carts_steps.resource
Resource            ../products/products_hooks.resource


*** Keywords ***
Register New Cart With Random Product
    [Documentation]    This keyword creates a new product and returns product response, product request body
    ...    and user response.
    [Arguments]    ${price}=${EMPTY}    ${quantity}=${EMPTY}
    ${response_product}    ${product_body}    ${response_user}    Register New Random Product
    ...    ${price}
    ...    ${quantity}
    ${new_products}    Get Cart Product Request Body
    ...    ${response_product.json()}[_id]
    ...    ${product_body}[quantidade]
    ${new_cart}    Get Cart Request Body    ${new_products}
    ${response}    ${registered_product}    Register New Cart
    ...    ${new_cart}
    ...    ${response_user.json()}[authorization]
    RETURN    ${response[0]}    ${registered_product}    ${response_user}
