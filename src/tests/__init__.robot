*** Settings ***
Documentation       Shared setup and cleanup for the API test suites.

Resource            ../business/hooks/framework_hooks/data_cleanup_hooks.resource

Suite Setup         Delete ID Files Directory
Suite Teardown      Data Cleanup


*** Keywords ***
Delete ID Files Directory
    [Documentation]    This keyword is used to remove ids file folder before test execution.
    Wait Until Keyword Succeeds
    ...    5s
    ...    1s
    ...    Remove Directory
    ...    ${FOLDER_FILE_PATH}
    ...    recursive=True

Data Cleanup
    [Documentation]    This keyword is used to clean up data after test execution.
    ...    It ensures that any data created during the test is properly removed or reset to maintain
    ...    a clean state for subsequent tests.
    Wait Until Keyword Succeeds
    ...    5s
    ...    1s    Run Test Data Cleanup

Run Test Data Cleanup
    [Documentation]    This keyword runs all hooks for test data cleanup.
    Delete Carts From User
    Delete Products From User
    Delete Created Users
