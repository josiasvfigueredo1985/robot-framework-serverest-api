*** Settings ***
Resource            ./test_resources/base_test_resources.resource

Test Setup          Start Mocking
Test Teardown       Stop Mocking
Test Template       Post Mock Login


*** Variables ***
${VALID_EMAIL}          test@example.com
${VALID_PASSWORD}       admin123
${INVALID_EMAIL}        testexample.com
${INVALID_PASSWORD}     admin12


*** Test Cases ***
Login Succeeds    ${VALID_EMAIL}    ${VALID_PASSWORD}    ${SUCCESS_STATUS}    ${SUCCESS_LOGIN_MESSAGE}
Login Fails With Valid Email And Invalid Password    ${VALID_EMAIL}    ${INVALID_PASSWORD}    ${INVALID_DATA_STATUS}    ${LOGIN_401}
Login Fails With Invalid Email And Valid Password    ${INVALID_EMAIL}    ${VALID_PASSWORD}    ${INVALID_DATA_STATUS}    ${LOGIN_401}


*** Keywords ***
Post Mock Login
    [Arguments]    ${email}    ${password}    ${status_code}    ${message}
    ${response}    Post Mock Login Request
    ...    email=${email}
    ...    password=${password}
    ...    status_code=${status_code}
    ...    message=${message}
    Status Should Be    ${status_code}    ${response}
    Should Be Equal    ${response.json()}[${MESSAGE_KEY}]    ${message}
