*** Settings ***
Documentation       This resource file contains keywords for managing REST API sessions.

Resource            ../base/base_config_variables.resource
Resource            ../../business/flow/authentication_flow.resource
Library             RequestsLibrary
Library             requests


*** Keywords ***
Start Session
    [Documentation]    Starts a new session with the given headers and configuration.
    &{HEADERS}    Create Dictionary    accept=${CONTENT_TYPE}
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
    ${AUTH_TOKEN}    Get Bearer Token
    &{HEADERS}    Create Dictionary    Authorization=${AUTH_TOKEN}    Content-Type=${CONTENT_TYPE}
    Create Session
    ...    ${SESSION_NAME}
    ...    ${BASE_URL}
    ...    headers=${HEADERS}
    ...    timeout=${TIMEOUT}
    ...    max_retries=${MAX_RETRIES}
    ...    backoff_factor=${BACKOFF_FACTOR}
    ...    retry_status_list=${RETRIES_STATUS_LIST}

End Session
    [Documentation]    Ends all active sessions.
    Delete All Sessions
