# pylint: disable=import-error
# pylint: disable=wrong-import-position
import os
import sys
from typing import List
from robot.api.deco import library, keyword


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.carrinhos.carrinhos_model import CarrinhosModel
from business.models.carrinhos.produtos_carrinho import ProdutosCarrinho


@library
class CarrinhosFactory:
    """
    Factory for creating CarrinhosModel and ProdutosCarrinho objects.
    """

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
        carrinho_obj = CarrinhosModel(produtos)
        return carrinho_obj.convert_object_to_dict(carrinho_obj)

    def create_produto_carrinho(self, idProduto, quantidade):
        """
        Create a new ProdutosCarrinho object with the given idProduto and quantidade.

        Args:
            idProduto: The id of the product.
            quantidade: The quantity of the product.

        Returns:
            ProdutosCarrinho object with the given idProduto and quantidade.
        """
        produto_carrinho_obj = ProdutosCarrinho(idProduto, int(quantidade))
        return produto_carrinho_obj
