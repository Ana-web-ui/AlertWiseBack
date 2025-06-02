from fastapi import APIRouter
from app.schemas.conquista_schema import Conquista
from app.database import get_connection

router = APIRouter()

@router.get("/conquistas")
def listar_conquistas():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id_conquista, id_usuario, descricao, TO_CHAR(data_conquista, 'YYYY-MM-DD') FROM conquista")
    conquistas = [
        {"id_conquista": c[0], "id_usuario": c[1], "descricao": c[2], "data_conquista": c[3]}
        for c in cursor.fetchall()
    ]
    cursor.close()
    conn.close()
    return conquistas

@router.post("/conquistas")
def adicionar_conquista(conquista: Conquista):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO conquista (id_conquista, id_usuario, descricao, data_conquista) VALUES (:1, :2, :3, TO_DATE(:4, 'YYYY-MM-DD'))",
        [conquista.id_conquista, conquista.id_usuario, conquista.descricao, conquista.data_conquista]
    )
    conn.commit()
    cursor.close()
    conn.close()
    return {"mensagem": "Conquista salva!"}
