from framework.utils.ObjectUtils import ObjectUtils


class LoginModel(ObjectUtils):
    """Class to represent the login model."""

    def __init__(self, email: str, password: str):
        self.email = email
        self.password = password
