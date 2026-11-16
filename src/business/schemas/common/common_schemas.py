from framework.utils.schema_utils import SchemaUtils


class CommonSuccessMessageSchema(SchemaUtils):
    """Schema for CommonGenericMessage"""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {"message": {"type": "string"}, "_id": {"type": "string"}},
        "required": ["message", "_id"],
    }


class CommonErrorMessageSchema(SchemaUtils):
    """Schema for CommonErrorMessage"""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {"message": {"type": "string"}},
        "required": ["message"],
    }
