import os
import sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.login.LoginModel import LoginModel  # noqa: E402



class LoginStep:

    def login_object(self, email: str, password: str):
        loginObject = LoginModel(email, password)
        return loginObject.to_dict()
