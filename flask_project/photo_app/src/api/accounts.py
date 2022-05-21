from flask import Blueprint, jsonify, abort, request
from ..models import Accounts, db
import hashlib
import secrets



def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()


bp = Blueprint('accounts', __name__, url_prefix='/accounts')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    username = Accounts.query.all()  # ORM performs SELECT query
    result = []
    for a in username:
        result.append(a.serialize())  # build list of User as dictionaries
    return jsonify(result)  # return JSON response


@bp.route('/<int:id>', methods=['GET']) # decorator takes path and list of HTTP verbs
def show(id: int):
    a = Accounts.query.get_or_404(id) # ORM performs SELECT query
    return jsonify(a.serialize())  # return JSON response


@bp.route('/<int:id>', methods=['PATCH', 'PUT']) # decorator takes path and list of HTTP verbs
def update(id: int):
    a = Accounts.query.get_or_404(id)
    # req body must contain username and password
    if 'username' not in request.json and 'password' not in request.json:
        return abort(400)
    # req username must be greater than 3 chars
    if 'username' in request.json:
        if len(request.json['username']) < 3:
            return abort(400)
        else:
            a.username = request.json['username']
    # req username must be greater than 8 chars
    if 'password' in request.json:
        if len(request.json['password']) < 8:
            return abort(400)
        else:
            a.password = scramble(request.json['password'])

    try:
        db.session.commit() # execute the UPDATE statment
        return jsonify(a.serialize())  # return JSON response
    except:
        # something went wrong :(
        return jsonify(False)


@bp.route('/<int:id>', methods=['DELETE']) # decorator takes path and list of HTTP verbs
def delete(id: int):
    a = Accounts.query.get_or_404(id)
    try:
        db.session.delete(a)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('', methods=['POST']) # decorator takes path and list of HTTP verbs
def create():
    # req body must contain username and password
    if 'username' not in request.json or 'password' not in request.json and 'first_name' not in request.json and 'last_name' not in request.json and 'email' not in request.json:
        return abort(400)

    if len(request.json['username']) < 3 and len(request.json['password']) < 8:
        return abort(400)
    # accounts with id of account_id must exist
    # User.query.get_or_404(request.json['user_id'])
    # construct Accounts
    a = Accounts(
        username=request.json['username'],
        password=scramble(request.json['password'])
    )
    db.session.add(a)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(a.serialize())