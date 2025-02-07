from business.models.login import LoginModel


class UsuariosModel(LoginModel):
    def __init__(self, nome: str, email: str, password: str, endereco: str):
        super().__init__(email, password)
        self.nome = nome
        self.endereco = endereco
