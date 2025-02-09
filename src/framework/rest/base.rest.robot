*** Settings ***
Resource    ../base/base.resources.resource
Resource    ../../business/flow/authentication.flow.robot


*** Keywords ***
Start Session
    &{HEADERS}    Create Dictionary    accept=${CONTENT_TYPE}
    Create Session    ${SESSION_NAME}    ${BASE_URL}    ${HEADERS}    timeout=${TIMEOUT}

Start Authenticated Session
    ${AUTH_TOKEN}    Get Bearer Token
    &{HEADERS}    Create Dictionary    Authorization=${AUTH_TOKEN}    Content-Type=${CONTENT_TYPE}
    Create Session    ${SESSION_NAME}    ${BASE_URL}    headers=${HEADERS}    timeout=${TIMEOUT}

End Session
    Delete All Sessions
