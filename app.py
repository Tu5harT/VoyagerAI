# app.py
import os
from sanic import Sanic
from sanic_cors import CORS
from rasa.core.run import serve_application

# --- CONFIGURATION ---
# Get the port from the environment variable provided by Render, default to 8080
port = int(os.environ.get("PORT", 8080))
# Get the path to the trained models directory
models_path = "models/"

# --- CREATE THE SANIC APP & APPLY CORS ---
# Create a new Sanic web application
app = Sanic(__name__)

# This is the most important part.
# It applies CORS headers to every request from any origin (*).
CORS(app, resources={r"/*": {"origins": "*"}})

# --- ATTACH THE RASA APP ---
# This function from Rasa attaches the core chatbot functionality
# to our custom Sanic app. We pass all the necessary startup parameters here.
serve_application(
    app,
    port=port,
    models=models_path,
    enable_api=True,
    # We DO NOT set --cors here, as Sanic-CORS is handling it.
    jwt_secret=None,
    jwt_method=None,
    auth_token=None,
    endpoints=None
)

# --- RUN THE APP ---
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=port)