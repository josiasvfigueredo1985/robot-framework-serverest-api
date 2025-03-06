*** Settings ***
Documentation       This resource file contains keywords for managing REST API sessions.

# Resource    ../base/base_rest_api_variables.resource
Library             RequestsLibrary
Library             ../utils/RestApiUtils.py
Library             OperatingSystem
Resource            ../base/base_rest_api_variables.resource


*** Keywords ***
Create API Session
    [Documentation]    Starts a new API session with the given headers and configuration.
    [Arguments]    ${headers}
    ${verify_certificate}=    Check Certificate
    ${session}=    Check Active Session
    ${check_auth_header}=    Run Keyword And Return Status    Should Contain    ${headers}    item=Authorization
    IF    ${check_auth_header}
        Log    ${headers['Authorization']}
        IF    ${session}
            Log    Ending all active sessions...
            End API Session
            Log    Creating a new authorized session...
            Create New Session    ${headers}    ${verify_certificate}
        END
    END
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
        ...    disable_warnings=${DISABLE_WARNINGS}
        ...    debug=${DEBUG_MODE}
        Log    Session ${SESSION_NAME} started.
    EXCEPT    HTTP errors    AS    ${error}
        Log    Could not start session ${SESSION_NAME}.    WARN
        Log    ${error}    WARN
    END

End API Session
    [Documentation]    Ends all active sessions.
    ${session}=    Check Active Session
    WHILE    ${session}
        Delete All Sessions
        ${session}=    Check Active Session
    END

Check Certificate
    [Documentation]    Checks the certificate based on the given environment.
    ${env_variable}=    Check Environment Variable
    ${test_env}=    Get Environment Variable    TEST_ENV
    IF    $env_variable == $test_env
        Suppress Certificate Warnings
        Log    Certificate verification is disabled for the ${env_variable} environment.
        VAR    ${DISABLE_WARNINGS}=    1
        RETURN    ${False}
    ELSE
        Log    Certificate verification is enabled for the ${env_variable} environment.
        RETURN    ${CERTIFICATE_PATH}
    END

Check Active Session
    [Documentation]    Checks the session status.
    ${state}=    Session Exists    ${SESSION_NAME}
    ${session}=    Convert To Boolean    ${state}
    RETURN    ${session}

Check Environment Variable
    [Documentation]    Checks if tests are running on CI, if QA_ENVIRONMENT is found,
    ...    so it returns it's value, otherwise will return 'Test' as environment
    ${test_env}=    Get Environment Variable    TEST_ENV
    ${env_var}=    Get Environment Variable    ENVIRONMENT_VAR    default=${test_env}
    RETURN    ${env_var}
