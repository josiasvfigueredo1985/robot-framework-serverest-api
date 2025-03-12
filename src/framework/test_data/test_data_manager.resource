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
    ${folder_path}    Set Variable    ${FOLDER_FILE_PATH}${resource}/${resource}_${ID_FILE}
    ${dir_exists}    Check If Directory Exists    ${resource}
    IF    ${dir_exists}
        ${id_list}    Get IDs    ${folder_path}
    ELSE
        ${id_list}    Set Variable    ${False}
    END
    RETURN    ${id_list}

Get IDs
    [Documentation]    Read and return ids from given folder.
    [Arguments]    ${folder_path}
    ${ids}    Get File    ${folder_path}
    @{id_list}    Split String    ${ids}    \n
    Remove Values From List    ${id_list}    ${EMPTY}
    RETURN    ${id_list}

Check If Directory Exists
    [Documentation]    Check if Ids were created along it's folder
    [Arguments]    ${resource}
    ${folder_path}    Set Variable    ${FOLDER_FILE_PATH}${resource}
    ${dir_exists}    Run Keyword And Return Status    Directory Should Exist    ${folder_path}
    IF    not ${dir_exists}    Log    Files for ${resource} not found.
    RETURN    ${dir_exists}
