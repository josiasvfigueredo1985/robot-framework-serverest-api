from framework.utils.schema_utils import SchemaUtils


class LoginPostSchema(SchemaUtils):
    """Schema for LoginPost"""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "message": {"type": "string"},
            "authorization": {"type": "string"},
        },
        "required": ["message", "authorization"],
    }
