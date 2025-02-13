*** Settings ***
Documentation       This resource file contains keywords for managing REST API sessions.

Resource            ../base/base_rest_api_variables.resource
Library             RequestsLibrary
Library             ../utils/RestApiUtils.py


*** Keywords ***
Create API Session
    [Documentation]    Starts a new API session with the given headers and configuration.
    [Arguments]    ${headers}
    ${verify_certificate}=    Check Certificate
    ${session}=    Session Exists    ${SESSION_NAME}
    IF    not ${session}
        Create New Session    ${headers}    ${verify_certificate}
    END

Create New Session
    [Documentation]    Creates a new session with the given headers and configuration.
    [Arguments]    ${headers}    ${verify_certificate}
    TRY
        Create Session
        ...    ${SESSION_NAME}
        ...    ${BASE_URL}
        ...    ${headers}
        ...    timeout=${TIMEOUT_SHORT}
        ...    max_retries=${MAX_RETRIES}
        ...    backoff_factor=${BACKOFF_FACTOR}
        ...    retry_status_list=${RETRIES_STATUS_LIST}
        ...    verify=${verify_certificate}
        Log    Session ${SESSION_NAME} started.
    EXCEPT    HTTP errors    AS    ${error}
        Log    Could not start session ${SESSION_NAME}.    WARN
        Log    ${error}    WARN
    END

End API Session
    [Documentation]    Ends all active sessions.
    Delete All Sessions

Check Certificate
    [Documentation]    Checks the certificate based on the given environment.
    IF    '${ENVIRONMENT}' == ${ENV_TYPE.tst}
        Suppress Certificate Warnings
        Log    Certificate verification is disabled for the ${ENVIRONMENT} environment.
        RETURN    ${False}
    ELSE IF    '${ENVIRONMENT}' == ${ENV_TYPE.prd}
        Log    Certificate verification is enabled for the ${ENVIRONMENT} environment.
        RETURN    ${CERTIFICATE_PATH}
    ELSE
        Log    "Environment not provided. Defaulting to Test settings."    WARN
        RETURN    ${False}
    END
