# cors_component.py
from sanic import Blueprint, response

# This blueprint will be attached to the Sanic app that Rasa runs.
# It creates a middleware that runs after each request.
bp = Blueprint("cors_tweak", url_prefix="/")

@bp.middleware("response")
async def cors_tweak(request, resp):
    # This function is called for every response the server sends.
    # We are forcefully adding the correct CORS header to it.
    resp.headers["Access-Control-Allow-Origin"] = "*"
    resp.headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS, PUT, DELETE"
    resp.headers["Access-Control-Allow-Headers"] = "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization"