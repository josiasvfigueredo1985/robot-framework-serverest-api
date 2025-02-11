*** Settings ***
Documentation       This resource file contains keywords for the login flow.

Resource            ../../framework/rest/base_request_methods.resource
Resource            usuario_flow.resource
Library             ../../business/factories/login_factory.py
Library             ../../business/factories/usuarios_factory.py


*** Keywords ***
Login Com Usuário Aleatório
    [Documentation]    This keyword logs in with a randomly created user.
    ${_}    ${randomUser}    Cadastrar Usuário Aleatório
    ${newLogin}    Create Login    ${randomUser}[email]    ${randomUser}[password]
    ${response}    POST Data    /login    ${newLogin}
    RETURN    ${response}
