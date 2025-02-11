*** Settings ***
Documentation       This resource file contains keywords for user flow operations.

Library             ../../business/factories/login_factory.py
Library             ../../business/factories/usuarios_factory.py
Resource            ../../framework/rest/base_request_methods.resource


*** Keywords ***
Cadastrar Usuário Aleatório
    [Documentation]    Register a new random user and return the response and random user object.
    ${randomUser}    Create Random User
    ${response}    POST Data    /usuarios    ${randomUser}
    RETURN    ${response}    ${randomUser}
