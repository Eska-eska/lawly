from flask import Blueprint, render_template
from flask_login import login_user, login_required, logout_user, current_user

view = Blueprint('view', __name__)


@view.route('/')
def home():
    return render_template("home.html", user=current_user)