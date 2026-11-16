from typing import Literal

from business.models.login.login_model import LoginModel


class UsersModel(LoginModel):
    """Class to represent the user model."""

    def __init__(
        self,
        nome: str,
        email: str,
        password: str,
        administrador: Literal["true", "false"],
    ):
        super().__init__(email, password)
        self.nome = nome
        self.administrador = administrador
