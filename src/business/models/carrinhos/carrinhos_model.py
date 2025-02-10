from typing import List
from business.models.carrinhos.produtos_carrinho import ProdutosCarrinho
from framework.utils.object_utils import ObjectUtils


class CarrinhosModel(ObjectUtils):
    def __init__(self, productos: List[ProdutosCarrinho]):
        self.productos = productos
