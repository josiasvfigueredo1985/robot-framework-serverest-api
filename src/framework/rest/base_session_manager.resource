*** Settings ***
Documentation       This resource file contains keywords for managing REST API sessions.

Resource            ../base/base_config_variables.resource
Library             RequestsLibrary
Library             ../utils/RestApiUtils.py


*** Keywords ***
Start Session
    [Documentation]    Starts a new session with the given headers and configuration.
    VAR    &{HEADERS}    accept=${CONTENT_TYPE}
    Check Certificate    ${ENVIRONMENT}
    ${session}=    Session Exists    ${SESSION_NAME}
    IF    not ${session}
        Create Session
        ...    ${SESSION_NAME}
        ...    ${BASE_URL}
        ...    ${HEADERS}
        ...    timeout=${TIMEOUT}
        ...    max_retries=${MAX_RETRIES}
        ...    backoff_factor=${BACKOFF_FACTOR}
        ...    retry_status_list=${RETRIES_STATUS_LIST}
        ...    verify=${CERTIFICATE_PATH}
        Log    Session ${SESSION_NAME} started.
    END

Start Authenticated Session
    [Documentation]    Starts a new authenticated session with the given headers and configuration.
    [Arguments]    ${AUTH_TOKEN}
    VAR    &{AUTH_HEADERS}    Authorization=${AUTH_TOKEN}    Content-Type=${CONTENT_TYPE}
    Check Certificate    ${ENVIRONMENT}
    ${auth_session}=    Session Exists    ${SESSION_NAME}
    IF    not ${auth_session}
        Create Session
        ...    ${SESSION_NAME}
        ...    ${BASE_URL}
        ...    headers=${AUTH_HEADERS}
        ...    timeout=${TIMEOUT}
        ...    max_retries=${MAX_RETRIES}
        ...    backoff_factor=${BACKOFF_FACTOR}
        ...    retry_status_list=${RETRIES_STATUS_LIST}
        ...    verify=${CERTIFICATE_PATH}
        Log    Authenticated session ${SESSION_NAME} started.
    END

End Session
    [Documentation]    Ends all active sessions.
    Delete All Sessions

Check Certificate
    [Documentation]    Checks the certificate based on the given environment.
    [Arguments]    ${environment}
    IF    '${environment}' == 'Test'
        Suppress Certificate Warnings
        Set Variable    ${CERTIFICATE_PATH}    ${False}
        Log    Certificate verification is disabled for the ${environment} environment.
    ELSE
        Set Variable    ${CERTIFICATE_PATH}    ${CERTIFICATE_PATH}
        Log    Certificate verification is enabled for the ${environment} environment.
    END
