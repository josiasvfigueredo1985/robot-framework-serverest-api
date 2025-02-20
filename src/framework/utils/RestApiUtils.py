from typing import Union
from robot.api.deco import library, keyword
import warnings
import urllib3
import urllib.parse


@library
class RestApiUtils:

    @keyword
    def suppress_certificate_warnings(self):
        warnings.simplefilter(
            "ignore", category=urllib3.exceptions.InsecureRequestWarning
        )

    @keyword
    def build_resource_with_query_parameters(
        self, resource: str, parameters: Union[dict, str]
    ):
        """
        Build a resource URL with query parameters.

        Args:
            resource (str): The base URL or resource path.
            parameters (Union[dict, str]): The query parameters as a dictionary or a single string.

        Returns:
            str: The constructed URL with query parameters.

        Examples:
            >>> build_resource_with_query_parameters('http://example.com/api', {'key1': 'value1', 'key2': 'value2'})
            'http://example.com/api?key1=value1&key2=value2'

            >>> build_resource_with_query_parameters('http://example.com/api', 'value')
            'http://example.com/api/value'
        """

        url = resource
        if isinstance(parameters, dict):
            query_string = "&".join(
                [
                    f"{urllib.parse.quote(key)}={urllib.parse.quote(str(value))}"
                    for key, value in parameters.items()
                ]
            )
            url += "?" + query_string
        elif isinstance(parameters, str):
            url += "/" + urllib.parse.quote(parameters)
        return url

    #
