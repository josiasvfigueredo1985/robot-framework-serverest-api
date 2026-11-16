*** Settings ***
Documentation       Products - View registered products or, as an administrator, manage store products

Resource            ../../base_business_resources/base_requests.resource


*** Variables ***
${PRODUCTS_RESOURCE}    produtos


*** Keywords ***
Get All Products
    [Documentation]    GET /produtos - List registered products
    [Arguments]    ${query}=${EMPTY}
    ${response}=    GET Data    ${PRODUCTS_RESOURCE}    ${query}
    RETURN    ${response}

Post New Product
    [Documentation]    POST /produtos - Register product
    ...    It is not permitted to register a product with a name already in use.
    [Arguments]    ${product_request_body}    ${token}
    ${response}=    POST Data    ${PRODUCTS_RESOURCE}    ${product_request_body}    ${token}
    ${product_id}=    Set Variable    ${response.json()}[_id]
    Append ID To File    ${PRODUCTS_RESOURCE}    ${product_id}
    RETURN    ${response}

Get Product By Id
    [Documentation]    GET /produtos/{_id} - Search for product by ID
    [Arguments]    ${id}
    ${response}=    GET Data    ${PRODUCTS_RESOURCE}    ${id}
    RETURN    ${response}

Delete Product By Id
    [Documentation]    DELETE /produtos/{_id} - Delete product
    ...    - It is not allowed to delete a product that is part of the cart.
    [Arguments]    ${id}    ${token}
    ${response}=    DELETE Data    ${PRODUCTS_RESOURCE}    ${id}    ${token}
    RETURN    ${response}

Put Product By Id
    [Documentation]    PUT /produtos/{_id} - Edit product
    ...    - It is not permitted to register a product with a name that is already in use.
    ...    - If a user with the provided ID is not found, a new registration will be performed instead of changing it.
    [Arguments]    ${id}    ${product_request_body}    ${token}
    ${response}=    PUT Data    ${PRODUCTS_RESOURCE}    ${id}    ${product_request_body}    ${token}
    RETURN    ${response}
