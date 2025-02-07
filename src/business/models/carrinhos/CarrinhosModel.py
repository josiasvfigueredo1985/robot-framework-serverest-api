from typing import List
from CarrinhosModel import CarrinhosModel
from business.models.common import BaseModel
class CarrinhosModel(BaseModel):
    def __init__(self,productos: List [CarrinhosModel]):
        self.productos = productos
