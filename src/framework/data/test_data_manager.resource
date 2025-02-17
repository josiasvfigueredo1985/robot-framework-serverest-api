*** Settings ***
Documentation       This resource file contains keywords for managing test data.

Library             Collections
Library             OperatingSystem
Library             String
Resource            ../../framework/rest/base_request_methods.resource


*** Variables ***
${FOLDER_FILE_PATH}=    src/framework/data/


*** Keywords ***
Append ID To File
    [Documentation]    Append the given ID to the file.
    [Arguments]    ${resource}    ${id}
    ${file_path}    Set Variable    ${resource}_${ID_FILE}
    Append To File    ${FOLDER_FILE_PATH}${resource}/${file_path}    ${id}\n
    Log    ID ${id} saved to file.

Get IDs From File
    [Documentation]    Retrieve all IDs from the file.
    [Arguments]    ${resource}
    ${file_path}    Set Variable    ${resource}_${ID_FILE}
    ${ids}    Get File    ${FOLDER_FILE_PATH}${resource}/${file_path}
    @{id_list}    Split String    ${ids}    \n
    Remove Values From List    ${id_list}    ${EMPTY}
    RETURN    ${id_list}

Delete All IDs From File
    [Documentation]    Delete all IDs from the file.
    [Arguments]    ${resource}    ${auth_token}= ${EMPTY}
    ${id_list}    Get IDs From File    ${resource}
    FOR    ${id}    IN    @{id_list}
        Log    Deleting ID: ${id}
        ${response}    DELETE Data    ${resource}    ${id}    ${auth_token}
        Log    ${response}
    END
    Remove File    ${ID_FILE}
    Log    All Id's are deleted.
