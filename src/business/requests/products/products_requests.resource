*** Settings ***
Documentation       Products - View registered products or, as an administrator, manage store products

Resource            ../base/base_requests.resource


*** Variables ***
${PRODUCTS_RESOURCE}    produtos


*** Keywords ***
Get All Products
    [Documentation]    GET /products - List registered products
    [Arguments]    ${query}=${EMPTY}
    ${response}    GET Data    ${PRODUCTS_RESOURCE}    ${query}
    RETURN    ${response}

Post New Product
    [Documentation]    POST /products - Register product
    ...    It is not permitted to register a product with a name already in use.
    [Arguments]    ${new_product_object}    ${token}
    ${response}    POST Data    ${PRODUCTS_RESOURCE}    ${new_product_object}    ${token}
    VAR    ${userId}    ${response.json()}[_id]
    Append ID To File    ${PRODUCTS_RESOURCE}    ${userId}
    RETURN    ${response}    ${new_product_object}

Get Product By Id
    [Documentation]    GET /products /{_id} - Search for product by ID
    [Arguments]    ${id}
    ${response}    GET Data    ${PRODUCTS_RESOURCE}    ${id}
    RETURN    ${response}

Delete Product By Id
    [Documentation]    DELETE /products /{_id} - Delete product
    ...    - It is not allowed to delete a product that is part of the cart.
    [Arguments]    ${id}    ${token}
    ${response}    DELETE Data    ${PRODUCTS_RESOURCE}    ${id}    ${token}
    RETURN    ${response}

Put Product By Id
    [Documentation]    PUT /products /{_id} - Edit product
    ...    - It is not permitted to register a product with a name that is already in use.
    ...    - If a user with the provided ID is not found, a new registration will be performed instead of changing it.
    [Arguments]    ${id}    ${data}    ${token}
    ${response}    PUT Data    ${PRODUCTS_RESOURCE}    ${id}    ${data}    ${token}
    RETURN    ${response}
