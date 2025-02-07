from typing import Any, Dict


class BaseModel:
    """
    Base class to provide access to_dict function
    """

    def to_dict(self) -> Dict[str, Any]:
        """
        Converts the model object to a dictionary.

        Returns:
            Dict[str, Any]: The model object converted to a dictionary.
        """
        return self.__dict__
