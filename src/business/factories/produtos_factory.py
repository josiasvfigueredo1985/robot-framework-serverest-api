import os
import sys
from robot.api.deco import library, keyword

sys.path.append(os.path.abspath(
    os.path.join(os.path.dirname(__file__), "../../")))
from business.models.produtos.productos_model import ProdutosModel  # noqa: E402


@library
class ProdutosFactory:

    @keyword
    def create_produto(self, nome, preco, descricao, quantidade):
        """
        Create a new ProdutosModel object with the given attributes.

        Args:
            nome: The name of the product.
            preco: The price of the product.
            descricao: The description of the product.
            quantidade: The quantity of the product.

        Returns:
            ProdutosModel object with the given attributes.
        """
        produtoObj = ProdutosModel(
            nome, float(preco), descricao, int(quantidade))
        return produtoObj.to_dict()
