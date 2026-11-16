*** Settings ***
Documentation       This resource file contains keywords for managing test data.

Library             framework.utils.directory_utils.DirectoryUtils
Library             OperatingSystem
Resource            ../rest/base_request_methods.resource


*** Variables ***
${FOLDER_FILE_PATH}     src/framework/files/
&{RESOURCE_STORAGE_NAMES}=    login=login    carrinhos=carts    produtos=products    usuarios=users


*** Keywords ***
Append ID To File
    [Documentation]    Append the given ID to the file.
    [Arguments]    ${resource}    ${id}
    ${storage_name}=    Set Variable    ${RESOURCE_STORAGE_NAMES}[${resource}]
    ${folder_path}=    Set Variable    ${FOLDER_FILE_PATH}${storage_name}
    Create Directory    ${folder_path}
    ${file_path}=    Set Variable    ${storage_name}_${ID_FILE}
    Append To File    ${folder_path}/${file_path}    ${id}\n
    Log    ID ${id} saved to file.

Get IDs From File
    [Documentation]    Retrieve all IDs from the file.
    [Arguments]    ${resource}
    ${storage_name}=    Set Variable    ${RESOURCE_STORAGE_NAMES}[${resource}]
    ${folder_path}=    Set Variable    ${FOLDER_FILE_PATH}${storage_name}/${storage_name}_${ID_FILE}
    ${dir_exists}=    Check If Directory Exists    ${resource}
    ${id_list}=    Set Variable    ${EMPTY}
    IF    $dir_exists
        ${id_list}=    Get IDs    ${folder_path}
    END
    RETURN    ${id_list}

Get IDs
    [Documentation]    Read and return ids from given folder.
    [Arguments]    ${folder_path}
    ${ids}=    Get File    ${folder_path}    encoding=UTF-8
    @{id_list}=    Split String    ${ids}    \n
    Remove Values From List    ${id_list}    ${EMPTY}
    RETURN    ${id_list}

Check If Directory Exists
    [Documentation]    Check if Ids were created along it's folder
    [Arguments]    ${resource}
    ${storage_name}=    Set Variable    ${RESOURCE_STORAGE_NAMES}[${resource}]
    ${folder_path}=    Set Variable    ${FOLDER_FILE_PATH}${storage_name}
    ${is_dir_exists}=    Directory Exists    ${folder_path}
    RETURN    ${is_dir_exists}
