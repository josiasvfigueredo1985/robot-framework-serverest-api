*** Settings ***
Documentation       Resource responsible for provide hooks common for all tests.

Library             OperatingSystem
Library             JSONLibrary
Library             ../../../framework/utils/DirectoryUtils.py
Library             ../../../framework/utils/SchemaUtils.py
Library             String


*** Keywords ***
Validate Common Response
    [Documentation]    HOOKS - Validate common response by schema file.
    [Arguments]    ${response}    ${message_type}
    VAR    ${schema_name}=    common
    ${schema_module}=    Get Schema Module Name    ${schema_name}
    ${schema_class_name}=    Get Schema Class Name    ${schema_name}    ${message_type}    is_common=${True}
    ${schema_file}=    Get Schema    ${schema_module}    ${schema_class_name}
    Validate Json By Schema    ${response}    ${schema_file}

Validate Response By Schema File
    [Documentation]    HOOKS - Validate response by schema file.
    [Arguments]    ${response}    ${schema_name}    ${request_method}
    ${schema_module}=    Get Schema Module Name    ${schema_name}
    ${schema_class_name}=    Get Schema Class Name    ${schema_name}    ${request_method}
    ${schema_file}=    Get Schema    ${schema_module}    ${schema_class_name}
    Validate Json By Schema    ${response}    ${schema_file}

Get Schema
    [Documentation]    HOOKS - Get schema from class given module and class name.
    [Arguments]    ${module_name}    ${schema_class_name}
    ${schema}=    Get Schema From Class    ${module_name}    ${schema_class_name}
    RETURN    ${schema}

Get Schema Module Name
    [Documentation]    HOOKS - Get schema module name.
    [Arguments]    ${schema_name}
    VAR    ${name_pattern}=    _schemas
    VAR    ${module_dir}=    business.schemas.
    VAR    ${module_name}=    ${module_dir}${schema_name}.${schema_name}${name_pattern}
    RETURN    ${module_name}

Get Schema Class Name
    [Documentation]    HOOKS - Get schema class name.
    [Arguments]    ${schema_name}    ${request_method}    ${is_common}=${False}
    VAR    ${message_type}=    message
    VAR    ${schema}=    schema
    IF    ${is_common}
        ${schema_class_name}=    Capitalize And Join
        ...    ${schema_name}
        ...    ${request_method}
        ...    ${message_type}
        ...    ${schema}
    ELSE
        ${schema_class_name}=    Capitalize And Join
        ...    ${schema_name}
        ...    ${request_method}
        ...    ${schema}
    END
    RETURN    ${schema_class_name}

Capitalize And Join
    [Documentation]    HOOKS - Capitalize and join words.
    [Arguments]    @{words}
    ${capitalized_words}=    Evaluate    "".join(word.capitalize() for word in ${words})
    RETURN    ${capitalized_words}
