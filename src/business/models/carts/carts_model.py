from typing import List
from business.models.carts.products_cart import ProductsCart
from framework.utils.ObjectUtils import ObjectUtils


class CartsModel(ObjectUtils):
    def __init__(self, products: List[ProductsCart]):
        self.products = products
