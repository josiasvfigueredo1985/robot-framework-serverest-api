*** Settings ***
Documentation       This resource file contains keywords for product flow operations.

Resource            ../requests/products/products_requests.resource


*** Keywords ***
Get Product Request Body
    [Documentation]    STEP - Get the request body for a new product.
    [Arguments]    ${price}=${EMPTY}    ${quantity}=${EMPTY}
    ${product_request_body}=    Create Random Product Body    ${price}    ${quantity}
    RETURN    ${product_request_body}

Register New Product
    [Documentation]    STEP - Register a new random product and returns response.
    [Arguments]    ${product_request_body}    ${token}
    ${response}=    Post New Product    ${product_request_body}    ${token}
    RETURN    ${response}

Get Registered Product
    [Documentation]    STEP - Retrieve product by id and returns response.
    [Arguments]    ${product_id}
    ${response}=    Get Product By Id    ${product_id}
    RETURN    ${response}

Delete Registered Product
    [Documentation]    STEP - Delete product by id and returns response.
    [Arguments]    ${product_id}    ${token}
    ${response}=    Delete Product By Id    ${product_id}    ${token}
    RETURN    ${response}

Update Registered Product
    [Documentation]    STEP - Update product by id and returns response.
    [Arguments]    ${product_id}    ${product_body}    ${token}
    ${response}=    Put Product By Id    ${product_id}    ${product_body}    ${token}
    RETURN    ${response}
