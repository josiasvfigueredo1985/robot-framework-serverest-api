*** Settings ***
Library             ../framework/mock/MockApi.py
Library             RequestsLibrary

Test Setup          Start Mocking
Test Teardown       Stop Mocking


*** Variables ***
&{user}=                id=123    name=Zé
&{new_user}=            id=123 name=Manoel
&{message_post}=        message=Usuário criado!
&{message_update}=      message=Usuário atualizado!
${base_url}=            https://api.exemplo.com


*** Test Cases ***
Testando Mock de GET
    Mock Get Request    ${base_url}/123    ${user}
    ${response}=    GET    ${base_url}/123
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}
    Should Be Equal    ${response.json()}    ${user}
    Should Be Equal As Strings    ${response.json()}[name]    Zé

Testando Mock de POST
    Mock Post Request
    ...    ${base_url}
    ...    ${user}
    ...    ${message_post}
    ...  200
    ${response}=    POST    ${base_url}    json=${user}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal    ${response.json()}    ${message_post}

Testando Mock de PATCH
    Mock Patch Request
    ...    ${base_url}/123
    ...    ${new_user}
    ...    ${message_update}
    ${response}=    PATCH    ${base_url}/123    json=${new_user}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal    ${response.json()}    ${message_update}

Testando Mock de DELETE
    Mock Delete Request    ${base_url}/123
    ${response}=    DELETE    ${base_url}/123
    Should Be Equal As Strings    ${response.status_code}    204
