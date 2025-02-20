from framework.utils.ObjectUtils import ObjectUtils


class ProductsModel(ObjectUtils):
    def __init__(self, nome: str, preco: float, descricao: str, quantidade: int):
        self.name = nome
        self.preco = preco
        self.descricao = descricao
        self.quantity = quantidade
