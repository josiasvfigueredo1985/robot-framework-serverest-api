*** Settings ***
Documentation       This resource file contains keywords for managing test data.

Library             OperatingSystem
Library             String
Resource            ../../framework/rest/base_request_methods.resource


*** Keywords ***
Append ID To File
    [Documentation]    Append the given ID to the file.
    [Arguments]    ${resource}    ${id}
    ${file_path}    Set Variable    ${resource}_${ID_FILE}
    Append To File    ${file_path}    ${id}\n
    Log    ID ${id} saved to file.

Get IDs From File
    [Documentation]    Retrieve all IDs from the file.
    [Arguments]    ${resource}
    ${file_path}    Set Variable    ${resource}_${ID_FILE}
    ${ids}    Get File    ${file_path}
    @{id_list}    Split String    ${ids}    \n
    RETURN    ${id_list}

Delete All IDs From File
    [Documentation]    Delete all IDs from the file.
    [Arguments]    ${resource}
    ${id_list}    Get IDs From File    ${resource}
    FOR    ${id}    IN    @{id_list}
        Log    Deleting ID: ${id}
        ${response}    DELETE By Id    ${resource}    ${id}
        Log    ${response}
    END
    Remove File    ${ID_FILE}
    Log    All Id's are deleted.

Delete Authorized All IDs From File
    [Documentation]    Delete all IDs from the file.
    [Arguments]    ${resource}    ${auth_token}
    ${id_list}    Get IDs From File    ${resource}
    FOR    ${id}    IN    @{id_list}
        Log    Deletando ID: ${id}
        ${response}    DELETE By Id Authorized    ${resource}    ${id}    ${auth_token}
        Log    ${response}
    END
    Remove File    ${ID_FILE}
    Log    All Id's are deleted.
