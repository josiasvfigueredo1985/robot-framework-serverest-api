from framework.utils.schema_utils import SchemaUtils


class CartsGetAllSchema(SchemaUtils):
    """Schema for all carts."""

    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "quantidade": {"type": "number"},
            "carts": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "produtos": {
                            "type": "array",
                            "items": {
                                "type": "object",
                                "properties": {
                                    "idProduto": {"type": "string"},
                                    "quantidade": {"type": "number"},
                                    "precoUnitario": {"type": "number"},
                                },
                                "required": [
                                    "idProduto",
                                    "quantidade",
                                    "precoUnitario",
                                ],
                            },
                        },
                        "precoTotal": {"type": "number"},
                        "quantidadeTotal": {"type": "number"},
                        "idUsuario": {"type": "string"},
                        "_id": {"type": "string"},
                    },
                    "required": [
                        "produtos",
                        "precoTotal",
                        "quantidadeTotal",
                        "idUsuario",
                        "_id",
                    ],
                },
            },
        },
        "required": ["quantidade", "carts"],
    }


class CartsGetByIdSchema(SchemaUtils):
    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "produtos": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "idProduto": {"type": "string"},
                        "quantidade": {"type": "number"},
                        "precoUnitario": {"type": "number"},
                    },
                    "required": ["idProduto", "quantidade", "precoUnitario"],
                },
            },
            "precoTotal": {"type": "number"},
            "quantidadeTotal": {"type": "number"},
            "idUsuario": {"type": "string"},
            "_id": {"type": "string"},
        },
        "required": ["produtos", "precoTotal", "quantidadeTotal", "idUsuario", "_id"],
    }
