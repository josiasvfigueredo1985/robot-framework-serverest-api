import os
import sys
from faker import Faker
from robot.api.deco import library, keyword

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))
from business.models.users.users_model import UsersModel  # noqa: E402

faker = Faker()


@library
class UsersFactory:

    @keyword
    def _create_user_body(self, name, email, password, administrator):
        """
        Create a new UsersModel object with the given name, email, password, and administrator.
        """

        userObj = UsersModel(name, email, password, administrator)
        return userObj.convert_object_to_dict(userObj)

    @keyword
    def create_random_user_body(self, isAdmin="true", emailDomain="test.com"):
        """
        Create a new UsersModel object with random name, email, password and administrator flag.
        If isAdmin is different from 'true' or 'false', it will default to True.
        """
        isAdmin = isAdmin.strip()
        if isAdmin not in ["true", "false"]:
            isAdmin = "true"
        if not emailDomain.strip():
            emailDomain = "test.com"
        randomUserObj = self._create_user_body(
            faker.name(),
            faker.email(domain=emailDomain),
            faker.password(),
            isAdmin,
        )
        return randomUserObj
