*** Settings ***
Documentation       This resource file contains keywords for managing test data.

Library             Collections
Library             OperatingSystem
Library             String
Resource            ../../framework/rest/base_request_methods.resource


*** Variables ***
${FOLDER_FILE_PATH}     src/framework/files/


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
    ${folder_path}    Set Variable    ${FOLDER_FILE_PATH}${resource}
    ${file_path}    Set Variable    ${resource}_${ID_FILE}
    ${dir_exists}    Check If Directory Exists    ${resource}
    IF    ${dir_exists}
        ${ids}    Get File    ${folder_path}/${file_path}
        @{id_list}    Split String    ${ids}    \n
        Remove Values From List    ${id_list}    ${EMPTY}
        RETURN    ${id_list}
    END

Delete By Ids From File
    [Documentation]    Delete all IDs from the file.
    [Arguments]    ${resource}    ${auth_token}=${EMPTY}
    ${id_list}    Get IDs From File    ${resource}
    ${dir_exists}    Check If Directory Exists    ${resource}
    IF    ${dir_exists}
        FOR    ${id}    IN    @{id_list}
            Log    Deleting ID: ${id}
            ${response}    DELETE Data    ${resource}    ${id}    ${auth_token}
            Log    ${response}
        END
    END

Delete By Token From File
    [Documentation]    Delete all IDs from the file.
    [Arguments]    ${resource}    ${parameter}    ${file_name}
    ${auth_list}    Get IDs From File    ${file_name}
    ${dir_exists}    Check If Directory Exists    ${resource}
    IF    ${dir_exists}
        FOR    ${auth_token}    IN    @{auth_list}
            Log    Deleting cart By Token: ${auth_token}
            ${response}    DELETE Data    ${resource}    ${parameter}    auth_token=${auth_token}
            Log    ${response}
        END
        Log    All Carts in ${resource} are deleted.
    END

Check If Directory Exists
    [Documentation]    Check if Ids were created along it's folder
    [Arguments]    ${resource}
    ${folder_path}    Set Variable    ${FOLDER_FILE_PATH}${resource}
    ${dir_exists}    Run Keyword And Return Status    Directory Should Exist    ${folder_path}
    IF    not ${dir_exists}    Log    Files for ${resource} not found.
    RETURN    ${dir_exists}
