*** Settings ***
Documentation       Resource responsible for provide hooks common for all tests.

Library             OperatingSystem
Library             String
Library             JSONLibrary
Library             ../../../framework/utils/DirectoryUtils.py
Library             ../../../framework/utils/SchemaUtils.py


*** Keywords ***
Validate Common Response
    [Documentation]    HOOKS - Validate common response by schema file.
    [Arguments]    ${response}    ${message_type}
    ${common_schema}=    Set Variable    common
    ${schema_module}=    HELPER - GET SCHEMA MODULE NAME    ${common_schema}
    ${schema_class_name}=    HELPER - GET SCHEMA CLASS NAME    ${common_schema}    ${message_type}    is_common=${True}
    ${schema_file}=    HELPER - GET SCHEMA    ${schema_module}    ${schema_class_name}
    Validate Json By Schema    ${response}    ${schema_file}

Validate Response By Schema File
    [Documentation]    HOOKS - Validate response by schema file.
    [Arguments]    ${response}    ${schema_name}    ${request_method}
    ${schema_module}=    HELPER - GET SCHEMA MODULE NAME    ${schema_name}
    ${schema_class_name}=    HELPER - GET SCHEMA CLASS NAME    ${schema_name}    ${request_method}
    ${schema_file}=    HELPER - GET SCHEMA    ${schema_module}    ${schema_class_name}
    Validate Json By Schema    ${response}    ${schema_file}

HELPER - GET SCHEMA
    [Documentation]    HELPER - Helper for Schema Validations hooks.
    ...    Get schema file from schema module and schema class name.
    [Arguments]    ${module_name}    ${schema_class_name}
    ${schema}=    Get Schema From Class    ${module_name}    ${schema_class_name}
    RETURN    ${schema}

HELPER - GET SCHEMA MODULE NAME
    [Documentation]    HELPER - Helper for Schema Validations hooks.
    ...    Get schema module name from schema name.
    [Arguments]    ${schema_name}
    ${pattern}=    Set Variable    _schemas
    ${module_dir}=    Set Variable    business.schemas
    VAR    ${module_name}=    ${module_dir}.${schema_name}.${schema_name}${pattern}
    RETURN    ${module_name}

HELPER - GET SCHEMA CLASS NAME
    [Documentation]    HELPER - Helper for Schema Validations hooks.
    ...    Get schema class name from schema name and request method.
    [Arguments]    ${schema_name}    ${request_method}    ${is_common}=${False}
    ${message_type}=    Set Variable    message
    ${specific}=    Set Variable    schema
    IF    ${is_common}
        ${schema_class_name}=    HELPER - CAPITALIZE AND JOIN
        ...    ${schema_name}
        ...    ${request_method}
        ...    ${message_type}
        ...    ${specific}
    ELSE
        ${schema_class_name}=    HELPER - CAPITALIZE AND JOIN
        ...    ${schema_name}
        ...    ${request_method}
        ...    ${specific}
    END
    RETURN    ${schema_class_name}

HELPER - CAPITALIZE AND JOIN
    [Documentation]    HELPER - Helper for Schema Validations hooks.
    ...    Capitalize and join words.
    [Arguments]    @{words}
    ${capitalized_words}=    Evaluate    "".join(word.capitalize() for word in ${words})
    RETURN    ${capitalized_words}
