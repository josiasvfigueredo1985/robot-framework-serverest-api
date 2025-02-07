from business.models.common.BaseModel import BaseModel


class LoginModel(BaseModel):
    def __init__(self, email: str, password: str):
        self.email = email
        self.password = password