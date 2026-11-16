from typing import List

from business.models.carts.products_cart import ProductsCart
from framework.utils.object_utils import ObjectUtils


class CartsModel(ObjectUtils):
    """Class to represent the cart model."""

    def __init__(self, produtos: List[ProductsCart]):
        self.produtos = produtos
