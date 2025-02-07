from business.models.common import BaseModel


class ProdutosModel(BaseModel):
    def __init__(self, nome: str, preco: float, descricao: str, quantidade: int):
        self.nome = nome
        self.preco = preco
        self.descricao = descricao
        self.quantidade = quantidade