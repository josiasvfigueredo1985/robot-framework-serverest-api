from typing import List
from business.models.carrinhos.carrinhos_model import CarrinhosModel
from business.models.common import base_model


class CarrinhosModel(base_model):
    def __init__(self, productos: List[CarrinhosModel]):
        self.productos = productos
