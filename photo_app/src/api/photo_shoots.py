from flask import Blueprint, jsonify, abort, request
from ..models import Events, Locations, Photo_shoots, db




bp = Blueprint('photo_shoots', __name__, url_prefix='/photo_shoots')

@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    id = Photo_shoots.query.all()  # ORM performs SELECT query
    result = []
    for ps in id:
        result.append(ps.serialize())  # build list of User as dictionaries
    return jsonify(result)  # return JSON response