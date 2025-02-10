from typing import Any, Dict, List, Set, Tuple, Union


class ObjectUtils:
    """
    Base class to provide access to_dict function
    """

    def convert_object_to_dict(
        self,
        obj: Any,
    ) -> Union[Dict[str, Any], List[Any], Tuple[Any, ...], Set[Any], Any]:
        """
        Convert simple and compklex nested obhject to a dictionary
        """

        if isinstance(obj, dict):
            return {
                key: self.convert_object_to_dict(value) for key, value in obj.items()
            }

        elif isinstance(obj, list):
            return [self.convert_object_to_dict(item) for item in obj]

        elif isinstance(obj, tuple):
            return tuple(self.convert_object_to_dict(item) for item in obj)

        elif isinstance(obj, set) or isinstance(obj, frozenset):
            return [self.convert_object_to_dict(item) for item in obj]

        elif hasattr(obj, "__dict__"):
            return {
                key: self.convert_object_to_dict(value)
                for key, value in obj.__dict__.items()
            }

        else:
            return obj
