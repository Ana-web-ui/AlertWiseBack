from fastapi import FastAPI
from app.routers import usuarios, historias, conquistas, noticias

app = FastAPI()

app.include_router(usuarios.router)
app.include_router(historias.router)
app.include_router(conquistas.router)
app.include_router(noticias.router)
