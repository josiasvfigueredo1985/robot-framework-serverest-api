from typing import Literal

from robot.api.deco import keyword, library

from business.models.dataclass.get_carts_data_class import GetCartsDataClass
from business.models.dataclass.get_products_data_class import GetProductsDataClass
from business.models.dataclass.get_users_data_class import GetUsersDataClass
from framework.utils.object_utils import ObjectUtils


@library
class GetByParameterFactory:
    @keyword
    def get_users_by_parameters(
        self,
        _id: str | None = None,
        nome: str | None = None,
        email: str | None = None,
        password: str | None = None,
        administrador: Literal["true", "false"] | None = None,
    ):  # -> Any:
        user_obj = GetUsersDataClass(
            _id, nome, email, password, administrador
        )
        return ObjectUtils.create_object(user_obj)

    @keyword
    def get_products_by_parameters(
        self,
        _id: str | None = None,
        nome: str | None = None,
        preco: int | None = None,
        descricao: str | None = None,
        quantidade: int | None = None,
    ):
        product_obj = GetProductsDataClass(
            _id, nome, preco, descricao, quantidade
        )
        return ObjectUtils.create_object(product_obj)

    @keyword
    def get_carts_by_parameters(
        self,
        _id: str | None = None,
        precoTotal: int | None = None,
        quantidadeTotal: int | None = None,
        idUsuario: str | None = None,
    ):
        cart_obj = GetCartsDataClass(
            _id, precoTotal, quantidadeTotal, idUsuario
        )
        return ObjectUtils.create_object(cart_obj)
