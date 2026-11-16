import requests_mock
from robot.api.deco import keyword, library


@library
class MockApi:
    def __init__(self):
        self.mock = requests_mock.Mocker()

    @keyword
    def start_mocking(self):
        self.mock.start()

    @keyword
    def stop_mocking(self):
        self.mock.stop()

    @keyword
    def mock_get_request(self, url: str, json_response: dict, status_code: int = 200):
        self.mock.get(url, json=json_response, status_code=status_code)

    @keyword
    def mock_post_request(
        self,
        url: str,
        request_body: dict,
        json_response: dict,
        status_code: int = 200,
    ):
        self.mock.post(
            url,
            json=json_response,
            status_code=status_code,
            additional_matcher=lambda req: req.json() == request_body,
        )

    @keyword
    def mock_delete_request(
        self, url: str, json_response: dict | None = None, status_code: int = 200
    ):
        self.mock.delete(url, json=json_response, status_code=status_code)

    @keyword
    def mock_put_request(
        self, url: str, request_body: dict, json_response: dict, status_code: int = 200
    ):
        self.mock.put(
            url,
            json=json_response,
            status_code=status_code,
            additional_matcher=lambda req: req.json() == request_body,
        )

    @keyword
    def mock_patch_request(
        self,
        url: str,
        partial_request_body: dict,
        json_response: dict,
        status_code: int = 200,
    ):
        self.mock.patch(
            url,
            json=json_response,
            status_code=status_code,
            additional_matcher=lambda req: req.json() == partial_request_body,
        )
