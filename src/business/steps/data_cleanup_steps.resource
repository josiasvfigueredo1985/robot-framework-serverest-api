*** Settings ***
Documentation       Resource responsible for run cleanup keywords.

Resource            ../../framework/data/test_data_manager.resource
Resource            ../../business/requests/carts/carts_requests.resource
Resource            ../../business/requests/users/users_requests.resource
Resource            ../../business/requests/products/products_requests.resource
Resource            ../../business/requests/login/login_requests.resource


*** Keywords ***
Delete Carts
    [Documentation]    STEP - Delete all created carts during testing.
    VAR    @{parameters}=    ${CANCEL_PURCHASE}    ${CHECK-OUT}
    FOR    ${param}    IN    @{parameters}
        Delete By Token From File    ${CART_RESOURCE}    ${param}    ${LOGIN_RESOURCE}
    END

Delete Products
    [Documentation]    STEP - Delete all created products during testing.
    VAR    ${last_token}=    ${EMPTY}
    VAR    ${ids_length}=    ${EMPTY}
    ${ids}=    Get IDs From File    ${LOGIN_RESOURCE}
    ${is_empty}=    Run Keyword And Return Status    Should Not Be Empty    ${ids}
    IF    ${is_empty}
        ${ids_length}=    Get Length    ${ids}
        IF    ${ids_length} > 1
            ${last_token}=    Get From List    ${ids}    -1
        ELSE IF    ${ids_length} == 1
            ${last_token}=    Get From List    ${ids}    0
        END
        Delete By Ids From File    ${PRODUCTS_RESOURCE}    ${last_token}
    END

Delete Users
    [Documentation]    STEP - Delete all created users during testing.
    Delete By Ids From File    ${USERS_RESOURCE}
