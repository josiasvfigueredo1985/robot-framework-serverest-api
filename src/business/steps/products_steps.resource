*** Settings ***
Documentation       This resource file contains keywords for product flow operations.

Resource            ../requests/products/products_requests.resource


*** Keywords ***
Get Product Request Body
    [Documentation]    Get the request body for a new product
    [Arguments]    ${price}=${EMPTY}    ${quantity}=${EMPTY}
    ${new_product_body}    Create Random Product Body    ${price}    ${quantity}
    RETURN    ${new_product_body}

Register New Product
    [Documentation]    Register a new random product and return the response and random product object.
    [Arguments]    ${product_body}    ${token}
    ${response}    Post New Product    ${product_body}    ${token}
    RETURN    ${response}    ${product_body}

Get Registered Product
    [Documentation]    Retrieve product by id
    [Arguments]    ${product_id}
    ${response}    Get Product By Id    ${product_id}
    RETURN    ${response}

Delete Registered Product
    [Documentation]    Delete product by id
    [Arguments]    ${product_id}    ${token}
    ${response}    Delete Product By Id    ${product_id}    ${token}
    RETURN    ${response}

Update Registered USer
    [Documentation]    Update product by id
    [Arguments]    ${product_id}    ${product_body}    ${token}
    ${response}    Put Product By Id    ${product_id}    ${product_body}    ${token}
    RETURN    ${response}
