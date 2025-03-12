*** Settings ***
Documentation       Resource responsible for run cleanup keywords.

Resource            ../../framework/base/base_data_manager_resources.resource
Resource            ../../business/steps/carts_steps.resource
Resource            ../../business/steps/users_steps.resource
Resource            ../../business/steps/products_steps.resource
Resource            ../../business/steps/login_steps.resource


*** Variables ***
${user_tokens}      ${EMPTY}


*** Keywords ***
Get User Tokens
    [Documentation]    STEP - Get all user tokens from LOGIN file.
    ${user_tokens}=    Get IDs From File    ${LOGIN_RESOURCE}
    Set Suite Variable    @{user_tokens}

Delete Carts
    [Documentation]    STEP - Delete all created carts during testing.
    Get User Tokens
    FOR    ${user_token}    IN    @{user_tokens}
        Log    Canceling Cart from user with id: ${user_token}
        ${response_cancel}=    Cancel Purchase    ${user_token}
        Log    ${response_cancel}
        Log    Concluding purchase from user with id: ${user_token}
        ${response_conclude}=    Conclude Purchase    ${user_token}
        Log    ${response_conclude}
    END

Delete Products
    [Documentation]    STEP - Delete all created products during testing.
    VAR    ${last_token}=    ${EMPTY}
    VAR    ${ids_length}=    ${EMPTY}
    Get User Tokens
    ${is_tokens_empty}=    Run Keyword And Return Status    Should Not Be Empty    ${user_tokens}
    IF    ${is_tokens_empty}
        ${ids_length}=    Get Length    ${user_tokens}
        IF    ${ids_length} > 1
            ${last_token}=    Get From List    ${user_tokens}    -1
        ELSE IF    ${ids_length} == 1
            ${last_token}=    Get From List    ${user_tokens}    0
        END
        ${products_ids}=    Get IDs From File    ${PRODUCTS_RESOURCE}
        FOR    ${product_id}    IN    @{products_ids}
            Log    Deleting product with id: ${product_id}
            ${response}=    Delete Registered Product    ${product_id}    ${last_token}
            Log    ${response}
        END
    END

Delete Users
    [Documentation]    STEP - Delete all created users during testing.
    ${user_ids}=    Get IDs From File    ${USERS_RESOURCE}
    FOR    ${user_id}    IN    @{user_ids}
        Log    Deleting user with id: ${user_id}
        ${response}=    Delete Registered User    ${user_id}
        Log    ${response}
    END
