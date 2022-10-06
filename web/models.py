"""from . import db
from sqlalchemy.sql import func


class Quest(db.Model):
    __tablename__ = 'quests'
    id = db.Column(db.Integer, primary_key=True)
    question = db.Column(db.String(10000))
    datein = db.Column(db.DateTime(timezone=True), default=func.now())
    dateps = db.Column(db.DateTime(timezone=True))
    op_id = db.Column(db.Integer, db.ForeignKey('op.id'))
    answer_id = db.Column(db.Integer, db.ForeignKey("answer.id"))
    loc_id = db.Column(db.Integer, db.ForeignKey("location.id"))
    ch_id = db.Column(db.Integer, db.ForeignKey("chanels.id"))
    

class Op(db.Model):
    __tablename__ = 'op'
    id = db.Column(db.Integer, primary_key=True)
    password = db.Column(db.String(150))
    name = db.Column(db.String(150))
    lawyers = db.relationship('Lawyer', back_populates="op")
    quests = db.relationship("Quest", back_populates="op")
    answers = db.relationship("Answer", back_populates="op")
    
class Location(db.Model):
    __tablename__ = 'location'
    id = db.Column(db.Integer)
    local = db.Column(db.String(100))
    quests = db.relationship('Quest', back_populates="location")
    
class Chanels(db.Model):
    __tablename__ = 'chanels'
    id = db.Column(db.Integer)
    chanel = db.Column(db.String(10))
    quests = db.relationship('Quest', back_populates="chanels")

class Lawyer(db.Model):
    __tablename__ = 'lawyers'
    id = db.Column(db.Integer, primary_key=True)
    fname = db.Column(db.String(100))
    lname = db.Column(db.String(100))
    mail = db.Column(db.String(100))
    op_id = db.Column(db.Integer, db.ForeignKey("op.id"))
    phone = db.relationship('Lwphone', back_populates="lw")
    answer = db.relationship('answer', back_populates="lw")
    #sect = db.relationship('Lawyersect', back_populates="lw")
    
class Lawyersect(db.Model):
    __tablename__ = 'lawyersect'
    lw_id = db.Column(db.Integer, db.ForeignKey("lw.id"))
    lwsect = db.Column(db.String(100))

class Lwphone(db.Model):
    __tablename__ = 'lwphone'
    lw_id = db.Column(db.Integer, db.ForeignKey("lw.id"))
    phone = db.Column(db.Integer)
    
class Answer(db.Model):
    __tablename__ = 'answer'
    id = db.Column(db.Integer, primary_key=True)
    answer = db.Column(db.String(1000))
    gc_id = db.Column(db.Integer, db.ForeignKey("gc.id"))
    gr_id = db.Column(db.Integer, db.ForeignKey("gr.id"))
    th_id = db.Column(db.Integer, db.ForeignKey("th.id"))    
    op_id = db.Column(db.Integer, db.ForeignKey("op.id"))
    quest_id = db.relationship('Quest', back_populates = "answer")
    lw_id = db.Column(db.Integer, db.ForeignKey("lw.id"))
    
class Gen_Catg(db.Model):
    __tablename__ = 'gc'
    id = db.Column(db.Integer, primary_key=True)
    gc = db.Column(db.String(50))
    ans_id = db.relationship('Answer', back_populates="gc")
    
class Group(db.Model):
    __tablename__ = 'gr'
    id = db.Column(db.Integer, primary_key=True)
    gr = db.Column(db.String(100))
    ans_id = db.relationship('Answer', back_populates="gr")

class Thing(db.Model):
    __tablename__ = 'th'
    id = db.Column(db.Integer, primary_key=True)
    th = db.Column(db.String(200))
    ans_id = db.relationship('Answer', back_populates="th")"""