import os
import sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from framework.utils.SchemaUtils import SchemaUtils


class CommonGenericMessageSchema(SchemaUtils):
    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {"message": {"type": "string"}, "_id": {"type": "string"}},
        "required": ["message", "_id"],
    }


class CommonErrorMessageSchema(SchemaUtils):
    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {"message": {"type": "string"}},
        "required": ["message"],
    }
