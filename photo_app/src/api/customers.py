
from flask import Blueprint, jsonify, abort, request
from ..models import Customers, db
import re


regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
def check(email):
    if (re.fullmatch(regex, email)):
        return email
    else:
        return abort(400)


bp = Blueprint('customers', __name__, url_prefix='/customers')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    email = Customers.query.all()  # ORM performs SELECT query
    result = []
    for c in email:
        result.append(c.serialize())  # build list of User as dictionaries
    return jsonify(result)  # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    c = Customers.query.get_or_404(id)
    return jsonify(c.serialize())

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    c = Customers.query.get_or_404(id)
    if 'first_name' not in request.json and 'last_name' not in request.json and 'email' not in request.json:
        return abort(400)

    if 'first_name' in request.json:
        if len(request.json['first_name']) < 1:
            return abort(400)
        else:
            c.first_name = request.json['first_name']

    if 'last_name' in request.json:
        if len(request.json['last_name']) < 1:
            return abort(400)
        else:
            c.last_name = request.json['last_name']
    
    if 'email' in request.json:
        if len(request.json['email']) < 7:
            return abort(400)
        else:
            c.email = check(request.json['email'])

    try:
        db.session.commit()
        return jsonify(c.serialize())
    except:
        return jsonify(False)