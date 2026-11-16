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

    @keyword
    def get_file_path(self, main_folder, file_name):
        """Get the file path given main folder and file name"""
        if not os.path.isdir(main_folder):
            raise ValueError(
                f"The provided main_folder '{main_folder}' is not a valid directory."
            )

        if not isinstance(file_name, str) or not file_name:
            raise ValueError("The file_name must be a non-empty string.")

        for root, _, files in os.walk(main_folder):
            for name in files:
                if name == file_name:
                    return os.path.abspath(os.path.join(root, name))

        raise FileNotFoundError(
            f"File '{file_name}' not found in directory '{main_folder}'."
        )
