from flask import Flask
from os import path

def create_app():
    app = Flask (__name__)
    app.config['SECRET_KEY'] = 'ASDASD'
    
    from .view import view
    from .auth import auth
    
    #from .models import Quest, Op, Location, Chanels, Lawyer, Lawyersect, Lwphone, Answer, Gen_Catg, Group, Thing
    
    app.register_blueprint ( view, url_prefix = '/')
    app.register_blueprint ( auth, url_prefix = '/')    
    
    return app
