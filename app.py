from pymongo import MongoClient
from flask import Flask,render_template,request,session,abort
app=Flask(__name__)

import pprint as p
client = MongoClient('mongodb://localhost:27017/')
db = client.collegee
collection = db.Users
dic = collection.find_one()


@app.route('/')
def index():
    return render_template('login.html',temp=dic)
"""
@app.route('/home', methods=["GET", "POST"])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        s=students(username,password)
        return render_template('home.html',username=username,password=password,students=students.query.all())

"""

app.run(debug=True)

"""



app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////students.sqlite'

db = SQLAlchemy(app)

class students(db.Model):
   user = db.Column('student_id', db.Integer, primary_key = True)
   passw = db.Column(db.String(100))


   def __init__(self, user, passw):
       self.user = user
       self.passw = passw

db.create_all()
temp=students.query.all()


"""