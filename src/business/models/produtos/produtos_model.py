from framework.utils.object_utils import ObjectUtils


class ProdutosModel(ObjectUtils):
    def __init__(self, nome: str, preco: float, descricao: str, quantidade: int):
        self.nome = nome
        self.preco = preco
        self.descricao = descricao
        self.quantidade = quantidade
