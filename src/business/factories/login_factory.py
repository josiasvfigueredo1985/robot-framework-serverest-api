from faker import Faker
from robot.api.deco import keyword, library

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
        login_obj = LoginModel(email, password)
        return login_obj.convert_object_to_dict(login_obj)
