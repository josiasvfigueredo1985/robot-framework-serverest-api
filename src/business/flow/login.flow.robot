*** Settings ***
Resource    ../../framework/base/base.resources.resource
Resource    usuario.flow.robot
Library     ../../business/factories/login_factory.py
Library     ../../business/factories/usuarios_factory.py


*** Keywords ***
Login com usuário aleatório
    ${-}    ${randomUser}    Cadastrar usuário aleatório
    ${newLogin}    Create Login    ${randomUser}[email]    ${randomUser}[password]
    ${response}    POST Data    /login    ${newLogin}
    RETURN    ${response}
