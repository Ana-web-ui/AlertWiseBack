from fastapi import APIRouter
from app.schemas.historia_schema import Historia
from app.database import get_connection

router = APIRouter()

@router.get("/historias")
def listar_historias():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id_historia, id_usuario, titulo, descricao FROM historia")
    historias = [
        {"id_historia": h[0], "id_usuario": h[1], "titulo": h[2], "descricao": h[3]}
        for h in cursor.fetchall()
    ]
    cursor.close()
    conn.close()
    return historias

@router.post("/historias")
def adicionar_historia(historia: Historia):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO historia (id_historia, id_usuario, titulo, descricao) VALUES (:1, :2, :3, :4)",
        [historia.id_historia, historia.id_usuario, historia.titulo, historia.descricao]
    )
    conn.commit()
    cursor.close()
    conn.close()
    return {"mensagem": "História cadastrada!"}
