class ProductsCart:
    """
    A class representing a product in a shopping cart.
    """

    def __init__(self, idProduto: str, quantidade: int):
        self.idProduto = idProduto
        self.quantidade = quantidade
