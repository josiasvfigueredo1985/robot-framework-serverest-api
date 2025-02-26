import os
import sys
from robot.api.deco import library, keyword
from faker import Faker


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.products.products_model import ProductsModel  # noqa: E402
from framework.utils.StringUtils import StringUtils

faker = Faker()


@library
class ProductsFactory:

    @keyword
    def create_product_body(
        self, name: str, price: float, description: str, quantity: int
    ):
        """
        Create a new ProductsModel object with the given attributes.

        Args:
            nome: The name of the product.
            price: The price of the product.
            description: The description of the product.
            quantity: The quantity of the product.

        Returns:
            ProductsModel object with the given attributes.
        """
        productObj = ProductsModel(name, int(price), description, int(quantity))
        return productObj.convert_object_to_dict(productObj)

    @keyword
    def create_random_product_body(self, price, quantity):
        """
        Create a new Random ProductsModel object.

        Args:
            nome: The name of the product.
            price: The price of the product.
            description: The description of the product.
            quantity: The quantity of the product.

        Returns:
            Random ProductsModel object with the given attributes.
        """
        if StringUtils.is_empty_string(price):
            price = faker.pyfloat(left_digits=2, right_digits=2, positive=True)
        if StringUtils.is_empty_string(quantity):
            quantity = faker.random_number()

        productObj = self.create_product_body(
            faker.company(),
            price,
            faker.text(max_nb_chars=20),
            quantity,
        )
        return productObj
