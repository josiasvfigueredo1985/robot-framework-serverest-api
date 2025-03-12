import os
import sys
from typing import Literal, Optional

from robot.api.deco import keyword, library

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from framework.utils.ObjectUtils import ObjectUtils
from business.models.dataclass import (
    GetCartsDataClass,
    GetProductsDataClass,
    GetUsersDataClass,
)


@library
class GetCartByParameterFactory:
    @keyword
    def get_users_by_parameters(
        self,
        _id: Optional[str] = None,
        nome: Optional[str] = None,
        email: Optional[str] = None,
        password: Optional[str] = None,
        administrador: Optional[Literal["true", "false"]] = None,
    ):  # -> Any:
        user_obj = GetUsersDataClass.GetUsersDataClass(
            _id, nome, email, password, administrador
        )
        return ObjectUtils.create_object(user_obj)

    @keyword
    def get_products_by_parameters(
        self,
        _id: Optional[str] = None,
        nome: Optional[str] = None,
        preco: Optional[int] = None,
        descricao: Optional[str] = None,
        quantidade: Optional[int] = None,
    ):
        product_obj = GetProductsDataClass.GetProductsDataClass(
            _id, nome, preco, descricao, quantidade
        )
        return ObjectUtils.create_object(product_obj)

    @keyword
    def get_carts_by_parameters(
        self,
        _id: Optional[str] = None,
        precoTotal: Optional[int] = None,
        quantidadeTotal: Optional[int] = None,
        idUsuario: Optional[str] = None,
    ):
        cart_obj = GetCartsDataClass.GetCartsDataClass(
            _id, precoTotal, quantidadeTotal, idUsuario
        )
        return ObjectUtils.create_object(cart_obj)
