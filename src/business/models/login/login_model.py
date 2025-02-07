from business.models.common.base_model import BaseModel


class LoginModel(BaseModel):
    def __init__(self, email: str, password: str):
        self.email = email
        self.password = password
