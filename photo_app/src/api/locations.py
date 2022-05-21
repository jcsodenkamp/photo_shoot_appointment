from flask import Blueprint, jsonify, abort, request
from ..models import Events, Locations, db




bp = Blueprint('locations', __name__, url_prefix='/locations')

@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    id = Locations.query.all()  # ORM performs SELECT query
    result = []
    for l in id:
        result.append(l.serialize())  # build list of User as dictionaries
    return jsonify(result)  # return JSON response