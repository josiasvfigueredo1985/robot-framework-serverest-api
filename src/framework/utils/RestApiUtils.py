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
        warnings.simplefilter(
            "ignore", category=urllib3.exceptions.InsecureRequestWarning
        )

    @keyword
    def build_resource_with_query_parameters(
        self, resource: str, parameters: Union[dict, str], isAlphanumeric: bool = False
    ):
        ''''Builds a resource URL with query parameters. '''
        url = resource
        if isinstance(parameters, dict):
            if not parameters:
                raise ValueError("The parameters dictionary must not be empty.")
            url += "?" + urlencode(parameters)
        elif isinstance(parameters, str) and parameters.strip():
            if StringUtils.is_valid_string(parameters, isAlphanumeric):
                url += "/" + quote(parameters)
        return url
