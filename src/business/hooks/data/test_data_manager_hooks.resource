*** Settings ***
Documentation       This resource file contains keywords for managing test data.

Resource            ../../../framework/data/test_data_manager.resource


*** Keywords ***
Delete Data After Testing
    [Documentation]    This keyword deletes data after testing.
    [Arguments]    ${resource}
    Get IDs From File    ${resource}
    Delete All IDs From File    ${resource}

Delete Authorized Data After Testing
    [Documentation]    This keyword deletes authorized data after testing.
    [Arguments]    ${resource}    ${auth_token}
    Get IDs From File    ${resource}
    Delete Authorized All IDs From File    ${resource}    ${auth_token}
