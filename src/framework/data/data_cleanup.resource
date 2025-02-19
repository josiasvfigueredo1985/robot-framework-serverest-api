*** Settings ***
Documentation       Resource responsible to run cleanup keywords.

Resource            test_data_manager.resource


*** Keywords ***
Run Cleanup Steps
    [Documentation]    Runs all steps for data cleanup.
    Delete Carts
    Delete Products
    Delete Users

Delete Carts
    [Documentation]    Delete all created carts during testing.
    VAR    @{parameters}=    cancelar-compra    concluir-compra
    FOR    ${param}    IN    @{parameters}
        Delete By Token From File    carrinhos    ${param}    login
    END

Delete Products
    [Documentation]    Delete all created products during testing.
    ${ids}=    Get IDs From File    login
    ${ids_length}=    Get Length    ${ids}
    IF    ${ids_length} > 1
        ${last_token}=    Get From List    ${ids}    -1
    ELSE IF    ${ids_length} == 1
        ${last_token}=    Get From List    ${ids}    0
    END
    Delete By Ids From File    produtos    ${last_token}

Delete Users
    [Documentation]    Delete all created users during testing.
    Delete By Ids From File    usuarios
