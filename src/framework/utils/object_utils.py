from typing import Any
import json


class ObjectUtils:
    """
    Base class to provide access to_dict function
    """

    def convert_object_to_dict(
        self,
        obj: Any,
    ):
        """
        Convert object to dictionary
        Args:
            obj: The object to be converted.
        Returns:
            A dictionary representation of the object.

        """
        return json.loads(json.dumps(obj, default=lambda o: o.__dict__, indent=4))
