from pydantic import BaseModel

class Historia(BaseModel):
    id_historia: int
    id_usuario: int
    titulo: str
    descricao: str
