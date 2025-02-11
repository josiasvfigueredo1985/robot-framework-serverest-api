*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Resource            ../../framework/base/base_resources.resource
Library             ../../business/factories/login_factory.py
Library             ../../business/factories/usuarios_factory.py
Resource            ../../framework/rest/base_rest.resource
Resource            ../../framework/rest/base_request_methods.resource


*** Keywords ***
Cadastrar Usuário Aleatório
    [Documentation]    Register a new random user and return the response and random user object.
    ${randomUser}    Create Random User
    ${response}    POST Data    /usuarios    ${randomUser}
    RETURN    ${response}    ${randomUser}
