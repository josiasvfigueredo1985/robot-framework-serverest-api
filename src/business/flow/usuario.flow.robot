*** Settings ***
Resource    ../../framework/base/base.resources.resource
Resource    ../../framework/rest/base.request.api.robot
Library     ../../business/factories/login_factory.py
Library     ../../business/factories/usuarios_factory.py


*** Keywords ***
Cadastrar usuário aleatório
    [Documentation]     Register a new random user and return the response and random user object.
    ${randomUser}    Create Random User
    ${response}    base.request.api.POST Data    /usuarios    ${randomUser}
    RETURN    ${response}    ${randomUser} 
