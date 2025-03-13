*** Settings ***
Documentation       This resource file contains keywords for carts operations.

Resource            ../../steps/products_steps.resource
Resource            ../login/login_hooks.resource


*** Variables ***
${PRODUCTS_NEW_PRODUCT_RESPONSE}=           ${EMPTY}
${PRODUCTS_NEW_PRODUCT_REQUEST_BODY}=       ${EMPTY}


*** Keywords ***
Register New Random Product
    [Documentation]    HOOKS - Register a new product
    ...    and sets suite variables PRODUCTS_NEW_PRODUCT_RESPONSE
    ...    and PRODUCTS_NEW_PRODUCT_REQUEST_BODY.
    [Arguments]    ${price}=${EMPTY}    ${quantity}=${EMPTY}
    Login With New Random User
    ${product_request_body}    Get Product Request Body    ${price}    ${quantity}
    ${response_product}    Register New Product
    ...    ${product_request_body}
    ...    ${LOGIN_BEARER_TOKEN}
    Set Suite Variable    ${PRODUCTS_NEW_PRODUCT_REQUEST_BODY}    ${product_request_body}
    Set Suite Variable    ${PRODUCTS_NEW_PRODUCT_RESPONSE}    ${response_product}

Validate Products Response Schema
    [Documentation]    HOOKS - Validate response by schema file.
    [Arguments]    ${response}    ${request_method}
    Validate Response By Schema File    ${response}    ${PRODUCTS_RESOURCE}    ${request_method}
