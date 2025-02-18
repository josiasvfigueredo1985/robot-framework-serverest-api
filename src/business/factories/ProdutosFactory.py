import os
import sys
from robot.api.deco import library, keyword
from faker import Faker

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.produtos.produtos_model import ProdutosModel  # noqa: E402

faker = Faker()


@library
class ProdutosFactory:

    @keyword
    def create_produto_body(self, nome, preco, descricao, quantidade):
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
        produtoObj = ProdutosModel(nome, float(preco), descricao, int(quantidade))
        return produtoObj.convert_object_to_dict(produtoObj)

    @keyword
    def create_random_produto_body(self):
        """
        Create a new Random ProdutosModel object.

        Args:
            nome: The name of the product.
            preco: The price of the product.
            descricao: The description of the product.
            quantidade: The quantity of the product.

        Returns:
            Random ProdutosModel object with the given attributes.
        """
        produtoObj = self.create_produto_body(
            faker.random_company_product(),
            faker.pyfloat(left_digits=2, right_digits=2, positive=True),
            faker.text(max_nb_chars=20),
            faker.random_number(),
        )
        return produtoObj.convert_object_to_dict(produtoObj)
