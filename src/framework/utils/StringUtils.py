import re
from typing import Any


class StringUtils:
    """
    Class for string manipulation, it has static methods
    """

    @staticmethod
    def is_valid_string(s: Any, isAlphaNumeric=False) -> bool:
        """# Method that validates if a string is valid, without spaces, None or other types

        Args:
            s (Any): _description_
            isId (bool, optional): _description_. Defaults to False.
        Example:
            * StringUtils.is_valid_string('1') # False
            * StringUtils.is_valid_string(' ') # False
            * StringUtils.is_valid_string(None) # False
            * StringUtils.is_valid_string('aB', True) # False
            * StringUtils.is_valid_string('aB1', True) # True
        Returns:
            bool: _description_
        """
        pattern = r"(?=.+[a-z]+)|(?=.*[A-Z])"
        if isAlphaNumeric:
            pattern = r"(?=.+[a-z])(?=.+[A-Z])(?=.+[0-9])"
        c = re.compile(pattern)
        if isinstance(s, str) and s.strip():
            return bool(c.search(s))
        return False
