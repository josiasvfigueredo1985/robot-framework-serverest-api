import json


class ObjectUtils:
    """
    Base class to provide access to_dict function
    """

    @staticmethod
    def convert_object_to_dict(obj: object):
        """
        Convert object to dictionary
        Args:
            obj: The object to be converted.
        Returns:
            A dictionary representation of the object.

        """
        return json.loads(json.dumps(obj, default=lambda o: o.__dict__, indent=4))

    @staticmethod
    def create_object(obj: object) -> dict:
        return {key: value for key, value in vars(obj).items() if value is not None}
