*** Settings ***
Documentation       This resource file contains keywords for carts operations.

Resource            ../../../business/steps/products_steps.resource
Resource            ../login/login_hooks.resource


*** Keywords ***
Register New Random Product
    [Documentation]    This keyword creates a new product and returns product response, product dictionary
    ...    and user response.
    [Arguments]    ${price}=${EMPTY}    ${quantity}=${EMPTY}
    ${response_user}    Login With New Random User
    ${new_random_product}    Get Product Request Body    ${price}    ${quantity}
    ${response}    ${registered_product}    Register New Product
    ...    ${new_random_product}
    ...    ${response_user.json()}[authorization]
    RETURN    ${response[0]}    ${registered_product}    ${response_user}
