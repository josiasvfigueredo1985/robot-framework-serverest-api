import os
import sys

sys.path.append(os.path.abspath(
    os.path.join(os.path.dirname(__file__), "../../")))
from business.schemas.common.schema_model import SchemaModel  # noqa: E402


class LoginPostSchema(SchemaModel):
    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "message": {
                "type": "string"
            },
            "authorization": {
                "type": "string"
            }
        },
        "required": [
            "message",
            "authorization"
        ]
    }
