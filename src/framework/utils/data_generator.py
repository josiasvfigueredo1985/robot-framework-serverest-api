from faker import Faker


class DataGenerator:
    """
    Generates fake data for testing purposes.

    :params:
        data_generator = DataGenerator() \n
        1 - newName = data_generator.fake.name() \n
        2 - newEmail = data_generator.fake.email()
    :return: 1 - random full name
    :return: 2 - random email
    """

    def __init__(self):
        fake = Faker()
        self.fake = fake
