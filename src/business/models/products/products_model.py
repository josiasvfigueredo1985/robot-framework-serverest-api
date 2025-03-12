from framework.utils.ObjectUtils import ObjectUtils


class ProductsModel(ObjectUtils):
    '''Class to represent the products model.'''
    def __init__(self, nome: str, preco: float, descricao: str, quantidade: int):
        self.nome = nome
        self.preco = preco
        self.descricao = descricao
        self.quantidade = quantidade
