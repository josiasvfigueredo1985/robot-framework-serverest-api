import os
import sys
from typing import List
from robot.api.deco import library, keyword

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.carts.carts_model import CartsModel, ProductsCart


@library
class CartsFactory:
    """
    Factory for creating CartsModel and ProductsCart objects.
    """

    @keyword
    def create_carts_body(self, products: List[ProductsCart]):
        """
        Create a new CartsModel object with the given products.

        Args:
            products: List of ProductsCart objects

        Returns:
            CartsModel object with the given products.
        """
        # Use random data
        cart_obj = CartsModel(products)
        return cart_obj.convert_object_to_dict(cart_obj)

    @keyword
    def create_product_cart_body(self, idProduct, quantity):
        """
        Create a new ProductsCart object with the given idProduct and quantity.

        Args:
            idProduct: The id of the product.
            quantity: The quantity of the product.

        Returns:
            ProductsCart object with the given idProduct and quantity.
        """
        product_cart_obj = ProductsCart(idProduct, int(quantity))
        return product_cart_obj
