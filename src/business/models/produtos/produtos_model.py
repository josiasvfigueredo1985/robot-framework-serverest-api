from framework.utils.object_util import ObjectUtil


class ProdutosModel(ObjectUtil):
    def __init__(self, nome: str, preco: float, descricao: str, quantidade: int):
        self.nome = nome
        self.preco = preco
        self.descricao = descricao
        self.quantidade = quantidade
