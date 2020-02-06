import os
from flask import Flask
from flask_cors import CORS

def create_app():
    app = Flask(__name__)
    app.config['JSON_AS_ASCII'] = False
    CORS(app)

    from . import control
    app.register_blueprint(control.bp)

    return app
