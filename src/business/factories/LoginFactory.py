import os
import sys
from robot.api.deco import library, keyword
from faker import Faker


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.login.login_model import LoginModel

faker = Faker()


@library
class LoginFactory:
    """
    LoginFactory
    """

    @keyword
    def create_login_body(self, email: str, password: str):
        """
        Create a new LoginModel object with the given email and password.

        Args:
            email: The email for the login.
            password: The password for the login.

        Returns:
            LoginModel object with the given email and password.
        """
        loginObj = LoginModel(email, password)
        return loginObj.convert_object_to_dict(loginObj)
