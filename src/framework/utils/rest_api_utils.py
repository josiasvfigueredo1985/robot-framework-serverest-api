"""This file contains the implementation of the RestApiUtils library."""

import warnings
from urllib.parse import quote, urlencode

import urllib3
from robot.api.deco import keyword, library

from framework.utils.string_utils import StringUtils


@library
class RestApiUtils:
    """This library provides utility keywords for working with REST APIs."""

    @keyword
    def suppress_certificate_warnings(self):
        """Suppresses the warnings related to SSL certificates."""
        warnings.simplefilter(
            "ignore", category=urllib3.exceptions.InsecureRequestWarning
        )

    @keyword
    def build_resource_with_query_parameters(
        self, resource: str, parameters: dict | str, is_alphanumeric: bool = False
    ):
        """'Builds a resource URL with query parameters."""
        url = resource
        if isinstance(parameters, dict) and not parameters:
            raise ValueError("The parameters dictionary must not be empty.")
        if isinstance(parameters, dict):
            url += "?" + urlencode(parameters)
        elif (
            isinstance(parameters, str)
            and parameters.strip()
            and StringUtils.is_valid_string(parameters, is_alphanumeric)
        ):
            url += "/" + quote(parameters)
        return url
