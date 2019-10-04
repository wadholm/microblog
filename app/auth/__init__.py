"""
Create auth Blurprint
"""
from flask import Blueprint

bp = Blueprint('auth', __name__)

from app.auth import routes    #pylint: disable=wrong-import-position, cyclic-import
