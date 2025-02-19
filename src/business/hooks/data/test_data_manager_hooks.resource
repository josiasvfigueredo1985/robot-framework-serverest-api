*** Settings ***
Documentation       This resource file contains keywords for managing test data.

Resource            ../../../framework/data/test_data_manager.resource


*** Keywords ***
Delete Data After Testing
    [Documentation]    This keyword deletes data after testing.
    [Arguments]    ${resource}    ${auth_token}=${EMPTY}
    Get IDs From File    ${resource}
    Delete By Ids From File    ${resource}    ${auth_token}
