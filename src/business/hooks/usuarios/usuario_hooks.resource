*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../../../business/steps/usuario_steps.resource
Resource            ../../../business/steps/login_steps.resource


*** Keywords ***
Register New Random User
    [Documentation]    This keyword logs in with a new user.
    ${new_random_user}    Create New User
    ${response}    ${registered_user}    Post New User    ${new_random_user}
    RETURN    ${response}    ${registered_user}
