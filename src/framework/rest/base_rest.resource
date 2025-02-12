*** Settings ***
Documentation       This resource file contains keywords for managing REST API sessions.

Resource            ../base/base_config_variables.resource
Library             RequestsLibrary


*** Keywords ***
Start Session
    [Documentation]    Starts a new session with the given headers and configuration.
    VAR    &{HEADERS}    accept=${CONTENT_TYPE}
    Create Session
    ...    ${SESSION_NAME}
    ...    ${BASE_URL}
    ...    ${HEADERS}
    ...    timeout=${TIMEOUT}
    ...    max_retries=${MAX_RETRIES}
    ...    backoff_factor=${BACKOFF_FACTOR}
    ...    retry_status_list=${RETRIES_STATUS_LIST}

Start Authenticated Session
    [Documentation]    Starts a new authenticated session with the given headers and configuration.
    [Arguments]    ${AUTH_TOKEN}
    VAR    &{AUTH_HEADERS}    Authorization=${AUTH_TOKEN}    Content-Type=${CONTENT_TYPE}
    Create Session
    ...    ${SESSION_NAME}
    ...    ${BASE_URL}
    ...    headers=${AUTH_HEADERS}
    ...    timeout=${TIMEOUT}
    ...    max_retries=${MAX_RETRIES}
    ...    backoff_factor=${BACKOFF_FACTOR}
    ...    retry_status_list=${RETRIES_STATUS_LIST}

End Session
    [Documentation]    Ends all active sessions.
    Delete All Sessions
