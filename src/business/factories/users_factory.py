"""Docstring for business.factories.UsersFactory
This class is responsible for creating UsersModel objects."""


from faker import Faker
from robot.api.deco import keyword, library

from business.models.users.users_model import UsersModel

faker = Faker()


@library
class UsersFactory:
    """Docstring for UsersFactory
    This class is responsible for creating UsersModel objects."""

    @keyword
    def _create_user_body(self, name, email, password, administrator):
        """
        Create a new UsersModel object with the given name, email, password, and administrator.
        """

        user_obj = UsersModel(name, email, password, administrator)
        return user_obj.convert_object_to_dict(user_obj)

    @keyword
    def create_random_user_body(self, is_admin, email_domain):
        """
        Create a new UsersModel object with random name, email, password and administrator flag.
        If is_admin is different from 'true' or 'false', it will default to True.
        """
        is_admin = is_admin.strip()
        if is_admin not in ["true", "false"]:
            is_admin = "true"
        if not email_domain.strip():
            email_domain = "test.com"
        random_user_obj = self._create_user_body(
            faker.name(),
            faker.email(domain=email_domain),
            faker.password(),
            is_admin,
        )
        return random_user_obj
