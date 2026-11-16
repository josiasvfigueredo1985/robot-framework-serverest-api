*** Settings ***
Documentation       Resource responsible for run cleanup keywords.

Resource            ../../steps/carts_steps.resource
Resource            ../../steps/users_steps.resource
Resource            ../../steps/products_steps.resource
Resource            ../../steps/login_steps.resource


*** Variables ***
@{USER_TOKEN}=      @{EMPTY}


*** Keywords ***
Get Tokens From Created Users
    [Documentation]    HOOKS - Get all user tokens from the login file.
    ${user_token_length}=    Get Length    ${USER_TOKEN}
    IF    $user_token_length<= 0    Get Tokens

Get Tokens
    [Documentation]    HOOKS - Get user token
    ${tokens}=    Get IDs From File    ${LOGIN_RESOURCE}
    Set Suite Variable    $USER_TOKEN    ${tokens}    # robocop: off

Delete Carts From User
    [Documentation]    HOOKS - Delete all created carts during testing.
    ${dir_exists}=    Check If Directory Exists    ${CART_RESOURCE}
    Get Tokens From Created Users
    IF    $dir_exists
        FOR    ${user_token}    IN    @{USER_TOKEN}
            Log    Canceling Cart from user with id: ${user_token}
            ${response_cancel}=    Cancel Purchase    ${user_token}
            Log    ${response_cancel}
            Log    Concluding purchase from user with id: ${user_token}
            ${response_conclude}=    Conclude Purchase    ${user_token}
            Log    ${response_conclude}
        END
    END

Delete Products From User
    [Documentation]    HOOKS - Delete all created products during testing.
    VAR    ${last_token}=    ${EMPTY}
    VAR    ${ids_length}=    ${EMPTY}
    ${dir_exists}=    Check If Directory Exists    ${PRODUCTS_RESOURCE}
    IF    $dir_exists
        Get Tokens From Created Users
        ${ids_length}=    Get Length    ${USER_TOKEN}
        IF    $ids_length > 1
            ${last_token}=    Get From List    ${USER_TOKEN}    -1
        ELSE IF    $ids_length == 1
            ${last_token}=    Get From List    ${USER_TOKEN}    0
        END
        ${products_ids}=    Get IDs From File    ${PRODUCTS_RESOURCE}
        Delete Products    ${products_ids}    ${last_token}
    END

Delete Products
    [Documentation]    Delete products given id list
    [Arguments]    ${products_ids}    ${user_token}
    FOR    ${product_id}    IN    @{products_ids}
        Log    Deleting product with id: ${product_id}
        ${response}=    Delete Registered Product    ${product_id}    ${user_token}
        Log    ${response}
    END

Delete Created Users
    [Documentation]    HOOKS - Delete all created users during testing.
    ${dir_exists}=    Check If Directory Exists    ${USERS_RESOURCE}
    IF    $dir_exists
        ${user_ids}=    Get IDs From File    ${USERS_RESOURCE}
        FOR    ${user_id}    IN    @{user_ids}
            Log    Deleting user with id: ${user_id}
            ${response}=    Delete Registered User    ${user_id}
            Log    ${response}
        END
    END
