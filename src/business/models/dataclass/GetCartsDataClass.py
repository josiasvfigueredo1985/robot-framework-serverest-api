from dataclasses import dataclass
from typing import Optional

from business.models.dataclass.DataClassModel import DataClassModel


@dataclass
class GetCartsDataClass(DataClassModel):
    precoTotal: Optional[int] = None
    quantidadeTotal: Optional[int] = None
    idUsuario: Optional[str] = None
