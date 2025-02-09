import os
import sys
from robot.api.deco import library, keyword


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.usuarios.usuarios_model import UsuariosModel  # noqa: E402
from framework.utils.data_generator import DataGenerator  # noqa: E402


@library
class UsuariosFactory:
    @keyword
    def create_usuario(self, nome, email, password, admnistrador):
        """
        Create a new UsuariosModel object with the given email and password.
        """
        usuarioObj = UsuariosModel(nome, email, password, admnistrador)
        return usuarioObj.convert_object_to_dict(usuarioObj)

    @keyword
    def create_random_user(self):
        """
        Create a new UsuariosModel object with random name, email, password and administrator flag.
        """
        faker = DataGenerator()
        randomUserObj = UsuariosModel(
            faker.fake.name(), faker.fake.email(), faker.fake.password(), "true"
        )
        return randomUserObj.convert_object_to_dict(randomUserObj)
