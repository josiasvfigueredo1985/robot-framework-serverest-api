*** Settings ***
Documentation       Resource responsible to run cleanup keywords.

Resource            ../../../business/steps/data_cleanup_steps.resource


*** Keywords ***
Run Data Cleanup
    [Documentation]    This hook runs all steps for data cleanup.
    Delete Carts
    Delete Products
    Delete Users
