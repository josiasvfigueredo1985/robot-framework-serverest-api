*** Settings ***
Resource  base.resources.resource


*** Keywords ***
Start Session
    Create Session        ${SESSION_NAME}        ${BASE_URL}

End Session
    Delete All Sessions
