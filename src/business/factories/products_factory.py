from faker import Faker
from robot.api.deco import keyword, library

from business.models.products.products_model import ProductsModel
from framework.utils.string_utils import StringUtils

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
        product_obj = ProductsModel(name, int(price), description, int(quantity))
        return product_obj.convert_object_to_dict(product_obj)

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
            price = faker.pyfloat(
                left_digits=2, right_digits=2, positive=True, min_value=1
            )
        if StringUtils.is_empty_string(quantity):
            quantity = faker.random_number()

        product_obj = self.create_product_body(
            faker.company(),
            price,
            faker.text(max_nb_chars=20),
            quantity,
        )
        return product_obj
