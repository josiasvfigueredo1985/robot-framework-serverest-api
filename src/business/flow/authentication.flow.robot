*** Settings ***
Resource    login.flow.robot

*** Keywords ***
Get Bearer Token
    ${response}  Login com usuário aleatório
    RETURN     ${response.json()}[authorization]