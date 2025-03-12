import requests
from jsonschema import validate, ValidationError


class SchemaUtils:
    SCHEMA = {}

    def validate_response_with_schema(self, schema_name, response):
        """Validates the response against the schema."""
        if schema_name not in self.SCHEMA:
            raise ValueError(
                f"Schema '{schema_name}' not found or in incorrect format."
            )

        try:
            json_data = (
                response.json() if isinstance(response, requests.Response) else response
            )
            if self.SCHEMA:
                validate(instance=json_data, schema=self.SCHEMA[schema_name])
            return True
        except ValidationError as e:
            return f"Schema validation error: {e.message}"
