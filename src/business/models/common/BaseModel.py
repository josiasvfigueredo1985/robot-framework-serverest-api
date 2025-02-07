from typing import Any, Dict


class BaseModel:
    def to_dict(self) -> Dict[str, Any]:
        return self.__dict__
