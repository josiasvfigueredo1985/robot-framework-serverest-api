import os
import sys
from typing import List
from robot.api.deco import library, keyword

sys.path.append(os.path.abspath(
    os.path.join(os.path.dirname(__file__), "../../")))
from business.models.carrinhos.carrinhos_model import CarrinhosModel  # noqa: E402
from business.models.carrinhos.produtos_carrinho import ProdutosCarrinho  # noqa: E402


@library
class CarrinhosFactory:
    @keyword
    def create_carrinhos(self, produtos: List[ProdutosCarrinho]):
        """
        Create a new CarrinhosModel object with the given productos.

        Args:
            produtos: List of ProdutosCarrinho objects

        Returns:
            CarrinhosModel object with the given productos.
        """
        # Use random data
        carrinhoObj = CarrinhosModel(produtos)
        return carrinhoObj.convert_object_to_dict(carrinhoObj)

    def create_produto_carrinho(self, idProduto, quantidade):
        """
        Create a new ProdutosCarrinho object with the given idProduto and quantidade.

        Args:
            idProduto: The id of the product.
            quantidade: The quantity of the product.

        Returns:
            ProdutosCarrinho object with the given idProduto and quantidade.
        """
        produtoCarrinhoObj = ProdutosCarrinho(idProduto, int(quantidade))
        return produtoCarrinhoObj
