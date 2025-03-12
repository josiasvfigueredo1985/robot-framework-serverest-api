import os
import sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from framework.utils.SchemaUtils import SchemaUtils


class UsersGetAllSchema(SchemaUtils):
    """Schema for UsersGetAll"""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "quantidade": {"type": "number"},
            "usuarios": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "nome": {"type": "string"},
                        "email": {"type": "string"},
                        "password": {"type": "string"},
                        "administrador": {"type": "string"},
                        "_id": {"type": "string"},
                    },
                    "required": ["nome", "email", "password", "administrador", "_id"],
                },
            },
        },
        "required": ["quantidade", "usuarios"],
    }


class UsersGetByIdSchema(SchemaUtils):
    """Schema for UsersGetById"""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "nome": {"type": "string"},
            "email": {"type": "string"},
            "password": {"type": "string"},
            "administrador": {"type": "string"},
            "_id": {"type": "string"},
        },
        "required": ["nome", "email", "password", "administrador", "_id"],
    }

    class UsersDeleteErrorSchema(SchemaUtils):
        """Schema for UsersDeleteError"""

        SCHEMA = {
            "$schema": "http://json-schema.org/draft-07/schema#",
            "title": "Generated schema for Root",
            "type": "object",
            "properties": {
                "message": {"type": "string"},
                "idCarrinho": {"type": "string"},
            },
            "required": ["message", "idCarrinho"],
        }
