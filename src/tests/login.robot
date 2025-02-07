*** Settings ***
Resource    ../framework/base/base.resources.resource

Library    ../business/factories/login_factory.py
Suite Setup    Start Session
Suite Teardown  End Session


*** Test Cases ***
Login com Usuário Padrão
    ${user}    Create Login       fulano@qa.com    teste
    ${response}    POST Data   /login       ${user} 
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal As Strings  ${response.json()}[message]     Login realizado com sucesso
    Dictionary Should Contain Key  ${response.json()}   authorization