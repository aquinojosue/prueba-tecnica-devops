import os
from typing import Optional

from fastapi import FastAPI, Header, HTTPException

app = FastAPI(title="Consulta de trámites", version="0.1.0")


@app.get("/health")
def health() -> dict:
    return {"status": "ok"}


TRAMITES = {
    "TRM-1001": {"estado": "en_revision", "paso": "validacion documental"},
    "TRM-1002": {"estado": "aprobado", "paso": "listo para retiro"},
}


@app.get("/tramites/{numero}")
def consultar_tramite(
    numero: str,
    x_api_key: Optional[str] = Header(default=None),
) -> dict:
    api_key = os.getenv("API_KEY")
    if not api_key or x_api_key != api_key:
        raise HTTPException(status_code=401, detail="no autorizado")

    tramite = TRAMITES.get(numero)
    if tramite is None:
        raise HTTPException(status_code=404, detail="tramite no encontrado")

    return {"numero": numero, **tramite}
