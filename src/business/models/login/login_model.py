from framework.utils.object_utils import ObjectUtils


class LoginModel(ObjectUtils):
    def __init__(self, email: str, password: str):
        self.email = email
        self.password = password
