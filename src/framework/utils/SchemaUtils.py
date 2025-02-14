import requests
from jsonschema import validate, ValidationError


class SchemaUtils:
    SCHEMA = {}

    def validate_response_with_schema(self, schema_name, response):
        """
        Validates the response against the provided schema.

        Args:
            response: The response to be validated.
            schema_name: The name of the schema to validate against.

        Returns:
            True if the response is valid against the schema, a string containing
            the validation error otherwise.

        Raises:
            ValueError: If the provided schema does not exist or is in incorrect format.
        """
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
