import importlib

from robot.api.deco import keyword, library


@library
class SchemaLoader:
    @keyword
    def get_schema_from_class(self, module_name, schema_class_name):
        """Return a schema dictionary from its module and class names."""
        try:
            schema_module = importlib.import_module(module_name)
        except ModuleNotFoundError as error:
            raise ValueError(f"Module '{module_name}' not found.") from error

        try:
            schema_class = getattr(schema_module, schema_class_name)
        except AttributeError as error:
            raise ValueError(
                f"The class '{schema_class_name}' was not found inside module '{module_name}'."
            ) from error

        return schema_class.SCHEMA
