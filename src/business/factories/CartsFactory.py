import os
import sys
from typing import List, Union
from robot.api.deco import library, keyword


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.carts.carts_model import CartsModel, ProductsCart
from framework.utils.StringUtils import StringUtils


@library
class CartsFactory:
    """
    Factory for creating CartsModel and ProductsCart objects.
    """

    @keyword
    def create_carts_body(self, products: List[ProductsCart]):
        cart_obj = CartsModel(products)
        return cart_obj.convert_object_to_dict(cart_obj)

    @keyword
    def create_product_cart_body(self, idProduct: Union[str, list], quantity):
        cart_prods = []
        if StringUtils.is_empty_string(quantity):
            quantity = 1
        if isinstance(idProduct, str):
            cart_prods.append(ProductsCart(idProduct, int(quantity)))
            return cart_prods
        if isinstance(idProduct, list):
            for id in idProduct:
                if isinstance(id, str) and id.strip():
                    cart_prods.append(ProductsCart(id, int(quantity)))
            return cart_prods
