
from flask import Blueprint, jsonify, abort, request
from ..models import Events, db




bp = Blueprint('events', __name__, url_prefix='/events')


@bp.route('', methods=['GET'])  # decorator takes path and list of HTTP verbs
def index():
    appt_date = Events.query.all()  # ORM performs SELECT query
    result = []
    for e in appt_date:
        result.append(e.serialize())  # build list of User as dictionaries
    return jsonify(result)  # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    e = Events.query.get_or_404(id)
    return jsonify(e.serialize())

