*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ../framework/data/data_cleanup.resource

Suite Setup         Delete ID Files Directory
Suite Teardown      Data Cleanup


*** Keywords ***
Data Cleanup
    [Documentation]    This keyword is used to clean up data after test execution.
    ...    It ensures that any data created during the test is properly removed or reset to maintain
    ...    a clean state for subsequent tests.
    Run Cleanup Steps

Delete ID Files Directory
    [Documentation]    This keyword is used to remove ids file folder before test execution.
    Remove Directory    ${FOLDER_FILE_PATH}    recursive=True
