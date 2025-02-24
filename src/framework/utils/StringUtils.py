import re
from typing import Any


class StringUtils:
    """
    Class for string manipulation, it has static methods
    """

    @staticmethod
    def is_valid_string(s: Any) -> bool:
        """Check if a string is valid
        - First check is value is instance of string class, then check if string is not empty
        Args:
            s (Any): Input value
        Returns:
            bool:
            - True if ['a']
            - False if [1, '', ' ', '#']
        """
        pattern = r"[a-zA-Z]"
        if isinstance(s, str):
            return bool(re.search(pattern, s))
        else:
            return False
