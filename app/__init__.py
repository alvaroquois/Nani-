from flask import Flask

app = Flask(__name__)

app.config['SECRET_KEY'] = '1'

from app import routes
