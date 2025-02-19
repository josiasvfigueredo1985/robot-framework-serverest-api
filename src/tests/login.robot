*** Settings ***
Documentation       This suite tests the login functionality with a new random user.

Resource            ../framework/base/base_test_resources.resource
# Suite Teardown    End API Session


*** Test Cases ***
Login com novo usuário aleatório
    [Documentation]    This test case logs in with a new random user and verifies the response.
    ${response}=    Login With New Random User
    Log    ${response}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Be Equal As Strings    ${response.json()}[message]    Login realizado com sucesso
    Dictionary Should Contain Key    ${response.json()}    authorization
