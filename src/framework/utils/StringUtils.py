import re
from typing import Any


class StringUtils:
    """
    Class for string manipulation, it has static methods
    """

    @staticmethod
    def is_valid_string(value: Any, is_alphanumeric=False) -> bool:
        """Check if a string is valid based on the given criteria"""

        pattern = r"(?=.+[a-z]+)|(?=.*[A-Z])"
        if is_alphanumeric:
            pattern = r"(?=.+[a-z])(?=.+[A-Z])(?=.+[0-9])"
        c = re.compile(pattern)
        if not StringUtils.is_empty_string(value):
            return bool(c.search(value))
        return False

    @staticmethod
    def is_empty_string(string) -> bool:
        """Check if a string is empty"""
        return bool(not (isinstance(string, str) and string.strip()))
