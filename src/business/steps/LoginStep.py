# import os
# import sys

# sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../..")))
from src.business.models.login.LoginModel import LoginModel


class LoginStep:
    def __init__(self):
        pass
    def login_object(self, email: str, password: str):
        loginObject = LoginModel(email, password)
        return loginObject.to_dict()
