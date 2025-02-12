import os
import sys
from faker import Faker
from robot.api.deco import library, keyword

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.usuarios.usuarios_model import UsuariosModel  # noqa: E402

faker = Faker()


@library
class UsuariosFactory:

    @keyword
    def create_usuario(self, nome, email, password, administrador):
        """
        Create a new UsuariosModel object with the given email and password.
        """
        usuarioObj = UsuariosModel(nome, email, password, administrador)
        return usuarioObj.convert_object_to_dict(usuarioObj)

    @keyword
    def create_new_user(self):
        """
        Create a new UsuariosModel object with random name, email, password and administrator flag.
        """
        randomUserObj = self.create_usuario(
            faker.name(), faker.email(domain="test.com"), faker.password(), "true"
        )
        return randomUserObj
