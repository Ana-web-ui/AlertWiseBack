from fastapi import APIRouter
from app.schemas.noticia_schema import Noticia
from app.database import get_connection

router = APIRouter()

@router.get("/noticias")
def listar_noticias():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id_noticia, titulo, conteudo, TO_CHAR(data_publicacao, 'YYYY-MM-DD') FROM noticia")
    noticias = [
        {"id_noticia": n[0], "titulo": n[1], "conteudo": n[2], "data_publicacao": n[3]}
        for n in cursor.fetchall()
    ]
    cursor.close()
    conn.close()
    return noticias

@router.post("/noticias")
def adicionar_noticia(noticia: Noticia):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO noticia (id_noticia, titulo, conteudo, data_publicacao) VALUES (:1, :2, :3, TO_DATE(:4, 'YYYY-MM-DD'))",
        [noticia.id_noticia, noticia.titulo, noticia.conteudo, noticia.data_publicacao]
    )
    conn.commit()
    cursor.close()
    conn.close()
    return {"mensagem": "Notícia adicionada!"}
