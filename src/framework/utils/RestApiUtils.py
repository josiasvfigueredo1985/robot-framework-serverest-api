from typing import Union
from urllib.parse import urlencode, quote
from robot.api.deco import library, keyword
import warnings
import urllib3
from StringUtils import StringUtils


@library
class RestApiUtils:

    @keyword
    def suppress_certificate_warnings(self):
        warnings.simplefilter("ignore", category=urllib3.exceptions.InsecureRequestWarning)

    @keyword
    def build_resource_with_query_parameters(self, resource: str, parameters: Union[dict, str]):
        """
        Build a resource URL with query parameters.

        Args:
            resource (str): The base URL or resource path.
            parameters (Union[dict, str]): The query parameters as a dictionary or a single string.

        Returns:
            str: The constructed URL with query parameters.
        Example:
            - resource = https://api.exemplo.com
            - id = 123
            - searchById = { '_id': '123abc'}
            - build_resource_with_query_parameters(resource, id) # https://api.exemplo.com/123
            - build_resource_with_query_parameters(resource, searchById) # https://api.exemplo.com?_id=123abc
        """
        url = resource
        if isinstance(parameters, dict):
            if not parameters:
                raise ValueError(
                    "The parameters dictionary must not be empty.")
            url += "?" + urlencode(parameters)
        elif isinstance(parameters, str) and parameters.strip():
            if StringUtils.is_valid_string(parameters, isId=True):
                url += "/" + quote(parameters)
        return url
