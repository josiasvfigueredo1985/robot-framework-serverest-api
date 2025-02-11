*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ../business/flow/login_flow.resource
Resource            ../framework/rest/base_request_methods.resource
Resource            ../framework/base/base_resources.resource

Test Teardown       End Session


*** Test Cases ***
Login com novo usuário aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    ${response}    Login Com Usuário Aleatório
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Login realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    authorization
    ${bearer}    Get Bearer Token
    Log    ${bearer}
