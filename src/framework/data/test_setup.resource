*** Settings ***
Documentation       Resource for Test Setup

Library             OperatingSystem


*** Keywords ***
Setup Environment
    [Documentation]    This keyword is responsible to remove test results folder, including files.
    Remove Directory    results    recursive=True
    Log    🧹 Test results were removes, starting tests...
