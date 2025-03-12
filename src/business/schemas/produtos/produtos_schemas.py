import os
import sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from framework.utils.SchemaUtils import SchemaUtils


class ProductsGetAllSchema(SchemaUtils):
    """Schema for ProductsGetAll"""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "quantidade": {"type": "number"},
            "produtos": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "nome": {"type": "string"},
                        "preco": {"type": "number"},
                        "descricao": {"type": "string"},
                        "quantidade": {"type": "number"},
                        "_id": {"type": "string"},
                    },
                    "required": ["nome", "preco", "descricao", "quantidade", "_id"],
                },
            },
        },
        "required": ["quantidade", "produtos"],
    }


class ProductsGetByIdSchema(SchemaUtils):
    """Schema for ProductsGetById"""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "nome": {"type": "string"},
            "preco": {"type": "number"},
            "descricao": {"type": "string"},
            "quantidade": {"type": "number"},
            "_id": {"type": "string"},
        },
        "required": ["nome", "preco", "descricao", "quantidade", "_id"],
    }


class ProductsDeleteErrorSchema(SchemaUtils):
    """Schema for ProductsDeleteError"""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "message": {"type": "string"},
            "idCarrinho": {"type": "array", "items": {"type": "string"}},
        },
        "required": ["message", "idCarrinho"],
    }
