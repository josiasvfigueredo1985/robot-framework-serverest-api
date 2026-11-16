from dataclasses import dataclass
from typing import Optional

from business.models.dataclass.data_class_model import DataClassModel


@dataclass
class GetUsersDataClass(DataClassModel):
    nome: Optional[str] = None
    email: Optional[str] = None
    password: Optional[str] = None
    administrador: Optional[str] = None
