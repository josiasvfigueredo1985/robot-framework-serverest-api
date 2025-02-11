from robot.api.deco import library, keyword


@library
class RestUtils:

    @keyword
    def build_resource_with_query_parameters(self, resource: str, parameters: dict):
        """
        Construct a resource with the provided query parameters.
        :param resource: The resource path without any query parameters.
        :param parameters: A dictionary of query parameters.
        :return: The constructed URL.
        * Example:
        ${params}=    Create List    id=123    nome=João    email=joao@exemplo.com

        ${buildedParameters}=   Build Resource With Query Parameters ${params}

        * Output: usuarios?id=123&nome=João&email=joao@exemplo.com
        """
        url = resource
        if parameters:
            url += "?" + "&".join(
                [f"{key}={value}" for key, value in parameters.items()]
            )
        return url
