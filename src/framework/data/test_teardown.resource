*** Settings ***
Documentation       Resource for Test Teardown

Library             OperatingSystem
Resource            data_cleanup.resource


*** Keywords ***
Check If All Tests Executed
    [Documentation]    This keyword check if all test suites are ran.
    ${exists}=    Run Keyword And Return Status    Directory Should Exist    results
    ${files}=    List Files In Directory    results
    IF    ${exists} and ${files}    Run Cleanup Steps
