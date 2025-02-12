import os
import sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from framework.utils.SchemaUtils import SchemaUtils


class CarrinhosGetAllSchema(SchemaUtils):
    SCHEMA = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "Generated schema for Root",
        "type": "object",
        "properties": {
            "quantidade": {"type": "number"},
            "carrinhos": {
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
        "required": ["quantidade", "carrinhos"],
    }


class CarrinhosGetByIdSchema(SchemaUtils):
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
