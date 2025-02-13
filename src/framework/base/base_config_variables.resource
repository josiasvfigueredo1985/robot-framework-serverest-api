*** Settings ***
Documentation       This resource file contains base configuration variables for the Serverest API tests.


*** Variables ***
${BASE_URL}=                https://serverest.dev/
${SESSION_NAME}=            serverest
${CONTENT_TYPE}=            application/json
${AUTH_TOKEN}=              ${EMPTY}
${TIMEOUT_SHORT}=           2
${TIMEOUT}=                 5
${TIMEOUT_LONG}=            10
${MAX_RETRIES}=             20
${BACKOFF_FACTOR}=          2
${RETRIES_STATUS_LIST}=     [500, 502, 503, 504, 400, 401, 403, 404]
${DISABLE_WARNINGS}=        0
${RETRIES_METHODS_LIST}=    ['HEAD', 'TRACE', 'DELETE', 'GET', 'PUT', 'OPTIONS']
&{AUTH_HEADERS}=            &{EMPTY}
&{HEADERS}=                 &{EMPTY}
${ID_FILE}=                 id_list.txt
