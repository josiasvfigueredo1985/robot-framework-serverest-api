# import os
# import sys

# sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../..")))

from src.business.models.common.BaseModel import BaseModel


class LoginModel(BaseModel):
    def __init__(self, email: str, password: str):
        self.email = email
        self.password = password