from pydantic import BaseModel

class Conquista(BaseModel):
    id_conquista: int
    id_usuario: int
    descricao: str
    data_conquista: str  # Formato ISO "YYYY-MM-DD"
