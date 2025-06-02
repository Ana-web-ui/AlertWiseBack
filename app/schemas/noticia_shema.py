from pydantic import BaseModel

class Noticia(BaseModel):
    id_noticia: int
    titulo: str
    conteudo: str
    data_publicacao: str
