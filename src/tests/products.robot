*** Settings ***
Documentation       Tests product registration.

Resource            ./test_resources/base_test_resources.resource


*** Test Cases ***
Register New Random Product
    [Documentation]    Registers a random product and validates the response.
    [Tags]    smoke
    Register New Random Product
    Status Should Be    ${CREATED_STATUS}    ${PRODUCTS_NEW_PRODUCT_RESPONSE}
    Should Be Equal As Strings    ${PRODUCTS_NEW_PRODUCT_RESPONSE.json()}[${MESSAGE_KEY}]    ${SUCCESS_CREATED_MESSAGE}
    Dictionary Should Contain Key    ${PRODUCTS_NEW_PRODUCT_RESPONSE.json()}    ${ID_KEY}
