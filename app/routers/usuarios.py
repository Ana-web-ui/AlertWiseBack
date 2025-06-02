from fastapi import APIRouter
from app.schemas.usuario_schema import Usuario
from app.database import get_connection

router = APIRouter()

@router.get("/usuarios")
def listar_usuarios():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id_usuario, nome, email FROM usuario")
    usuarios = [{"id_usuario": u[0], "nome": u[1], "email": u[2]} for u in cursor.fetchall()]
    cursor.close()
    conn.close()
    return usuarios

@router.post("/usuarios")
def adicionar_usuario(usuario: Usuario):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO usuario (id_usuario, nome, email) VALUES (:1, :2, :3)",
        [usuario.id_usuario, usuario.nome, usuario.email]
    )
    conn.commit()
    cursor.close()
    conn.close()
    return {"mensagem": "Usuário criado com sucesso!"}
