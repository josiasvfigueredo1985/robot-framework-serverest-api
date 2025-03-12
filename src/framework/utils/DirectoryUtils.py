import os
from robot.api.deco import library, keyword


@library
class DirectoryUtils:
    """Library for directory operations."""

    @keyword
    def directory_exists(self, directory_path):
        """Check if a directory exists.
        return: True if the directory exists, False otherwise.
        """
        return os.path.isdir(directory_path)
