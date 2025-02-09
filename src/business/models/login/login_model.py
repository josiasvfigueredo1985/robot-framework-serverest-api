
from framework.utils.object_util import ObjectUtil


class LoginModel(ObjectUtil):
    def __init__(self, email: str, password: str):
        self.email = email
        self.password = password
