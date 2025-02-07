import os
import sys
from robot.api.deco import library, keyword


sys.path.append(os.path.abspath(
    os.path.join(os.path.dirname(__file__), "../../")))
from business.models.usuarios.usuarios_model import UsuariosModel  # noqa: E402


@library
class UsuariosFactory:

    @keyword
    def create_usuario(self, email, password):
        usuarioObj = UsuariosModel(email, password)
        return usuarioObj.to_dict()
