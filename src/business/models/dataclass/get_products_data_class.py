from dataclasses import dataclass
from typing import Optional

from business.models.dataclass.data_class_model import DataClassModel


@dataclass
class GetProductsDataClass(DataClassModel):
    nome: Optional[str] = None
    preco: Optional[int] = None
    descricao: Optional[str] = None
    quantidade: Optional[int] = None
