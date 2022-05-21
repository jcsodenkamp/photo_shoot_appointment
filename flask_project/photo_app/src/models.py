
from sqlite3 import Date
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import PrimaryKeyConstraint


db = SQLAlchemy()


# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships

class Accounts(db.Model):
    __tablename__ = 'accounts'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(128), nullable=False)
    password = db.Column(db.String(128), nullable=False)
    customers = db.relationship(
        'Customers', backref='accounts', cascade='all,delete')

    def __init__(self, username: str, password: str):
        self.username = username
        self.password = password

    def serialize(self):
        return {
            'id': self.id,
            'username': self.username,
        }


class Customers(db.Model):
    __tablename__ = 'customers'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    account_id = db.Column(db.Integer, nullable=True)
    first_name = db.Column(db.String(128), nullable=False)
    last_name = db.Column(db.String(128), nullable=False)
    email = db.Column(db.String(128), nullable=False)
    account_id = db.Column(db.Integer, db.ForeignKey(
        'accounts.id'), nullable=False)

    def __init__(self, first_name: str, last_name: str, email: str):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email
        }


class CustomersEvents(db.Model):
    __tablename__ = 'customers_events'
    __table_args__ = (PrimaryKeyConstraint('customer_id', 'event_id'),)
    customer_id = db.Column(db.Integer, nullable=False)
    event_id = db.Column(db.Integer, nullable=False)
    price = db.Column(db.String(128), nullable=False)
    photo_type = db.Column(db.String(128), nullable=False)
    customer_id = db.Column(db.Integer, db.ForeignKey(
        'customers.id'), nullable=False)
    event_id = db.Column(db.Integer, db.ForeignKey(
        'events.event_id'), nullable=False)


class Events(db.Model):
    __tablename__ = 'events'
    event_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    customer_id = db.Column(db.Integer, nullable=False)
    appt_date = db.Column(db.Date, nullable=False)
    location_id = db.Column(db.Integer, nullable=False)
    photo_shoot_id = db.Column(db.Integer, nullable=False)
    duration = db.Column(db.String(128), nullable=False)
    appt_time = db.Column(db.String(128), nullable=False)
    location_id = db.Column(db.Integer, db.ForeignKey(
        'locations.id'), nullable=False)
    photo_shoot_id = db.Column(db.Integer, db.ForeignKey(
        'photo_shoots.id'), nullable=False)

    def __init__(self, customer_id: int, location_id: int, photo_shoot_id: int, appt_date: Date, appt_time: str, duration: str):
        self.customer_id = customer_id
        self.location_id = location_id
        self.photo_shoot_id = photo_shoot_id
        self.appt_date = appt_date
        self.duration = duration
        self.appt_time = appt_time

    def serialize(self):
        return {
            'id': self.event_id,
            'customer_id': self.customer_id,
            'location_id': self.location_id,
            'photo_shoot_id': self.photo_shoot_id,
            'appt_date': self.appt_date,
            'duration': self.duration,
            'appt_time': self.appt_time
        }


class Locations(db.Model):
    __tablename__ = 'locations'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    locations = db.Column(db.String(128), nullable=False)
    numb_pers = db.Column(db.Integer, nullable=False)

    def __init__(self, locations: str, numb_pers: int):
        self.locations = locations
        self.numb_pers = numb_pers

    def serialize(self):
        return {
            'id': self.id,
            'locations': self.locations,
            'numb_pers': self.numb_pers
        }


class Photo_shoots(db.Model):
    __tablename__ = 'photo_shoots'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    event_id = db.Column(db.Integer, nullable=False)
    duration = db.Column(db.String(128), nullable=False)

    def __init__(self, event_id: int, duration: str):
        self.event_id = event_id
        self.duration = duration

    def serialize(self):
        return {
            'id': self.id,
            'event_id': self.event_id,
            'duration': self.duration
        }
