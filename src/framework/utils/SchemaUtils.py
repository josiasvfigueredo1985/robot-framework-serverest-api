import importlib
from robot.api.deco import library, keyword


@library
class SchemaUtils:
    SCHEMA = {}

    @keyword
    def get_schema_from_class(self, module_name, schema_class_name):
        """Retrieve schema from class dynamically"""
        # module_name = f"business.schemas.{schema_name}.{schema_name}_schemas"
        # schema_class_name = (
        #     f"{schema_name.capitalize()}{request_method.capitalize()}Schema"
        # )
        try:
            # Import module dynamically
            schema_module = importlib.import_module(module_name)

            # Retrieve schema class from module
            schema_class = getattr(schema_module, schema_class_name)

            # Return schema from class
            return schema_class.SCHEMA

        except ModuleNotFoundError:
            raise ValueError(f"Module '{module_name}' not found.")
        except AttributeError:
            raise ValueError(
                f"The class '{schema_class_name}' was not found inside module '{module_name}'."
            )
