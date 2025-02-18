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
    def _create_user_body(self, nome, email, password, administrador):
        """
        Create a new UsuariosModel object with the given nome, email, password, and administrador.
        """
        usuarioObj = UsuariosModel(nome, email, password, administrador)
        return usuarioObj.convert_object_to_dict(usuarioObj)

    @keyword
    def create_random_user_body(self, isAdmin="true", emailDomain="test.com"):
        """
        Create a new UsuariosModel object with random name, email, password and administrador flag.
        If isAdmin is different from 'true' or 'false', it will default to True.
        """
        isAdmin = isAdmin.strip()
        if isAdmin not in ["true", "false"]:
            isAdmin = "true"
        if not emailDomain.strip():
            emailDomain = "test.com"
        randomUserObj = self._create_user_body(
            faker.name(),
            faker.email(domain=emailDomain),
            faker.password(),
            isAdmin,
        )
        return randomUserObj
