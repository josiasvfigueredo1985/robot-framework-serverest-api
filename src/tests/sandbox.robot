*** Settings ***
Library             ../framework/mock/MockApi.py
Library             RequestsLibrary

Test Setup          Start Mocking
Test Teardown       Stop Mocking


*** Variables ***
&{user1}=               id=443    name=Marcus
&{user2}=               id=834    name=John
@{users_list}=          &{user1}    &{user2}
&{users}=               users=${users_list}
&{new_user}=            id=123    name=Manoel
&{patch_user}=          id=123    name=Joaquim
&{put_user}=            id=456    name=Marcos
&{message_post}=        message=Usuário criado!
&{message_update}=      message=Usuário atualizado!
${base_url}=            https://api.exemplo.com
&{deleted_user}=        message=Usuário deletado com sucesso!


*** Test Cases ***
Testando Mock de GET
    Mock Get Request    ${base_url}/123    ${users}    status_code=200
    ${response}=    GET    ${base_url}/123
    Status Should Be    200    ${response}
    Log    ${response.json()}
    Should Be Equal    ${response.json()}    ${users}
    Should Be Equal As Strings    ${response.json()}[users][0][name]    Marcus

Testando Mock de POST
    Mock Post Request
    ...    ${base_url}
    ...    ${new_user}
    ...    ${message_post}
    ...    200
    ${response}=    POST    ${base_url}    json=${new_user}
    Status Should Be    200    ${response}
    Should Be Equal    ${response.json()}    ${message_post}

Testando Mock de PATCH
    Mock Patch Request
    ...    ${base_url}/123
    ...    ${patch_user}
    ...    ${message_update}
    ${response}=    PATCH    ${base_url}/123    json=${patch_user}
    Status Should Be    200    ${response}
    Should Be Equal    ${response.json()}[message]    Usuário atualizado!

Testando Mock de PUT
    Mock Patch Request
    ...    ${base_url}/123
    ...    ${put_user}
    ...    ${message_update}
    ${response}=    PATCH    ${base_url}/123    json=${put_user}
    Status Should Be    200    ${response}
    Should Be Equal    ${response.json()}    ${message_update}

Testando Mock de DELETE
    Mock Delete Request    ${base_url}/123    ${deleted_user}
    ${response}=    DELETE    ${base_url}/123
    Status Should Be    200    ${response}
    Should Be Equal As Strings    ${response.json()}[message]    Usuário deletado com sucesso!
