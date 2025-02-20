class ProductsCart:
    """
    A class representing a product in a shopping cart.
    """

    def __init__(self, idProduct: str, quantity: int):
        self.idProduct = idProduct
        self.quantity = quantity
