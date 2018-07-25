#from pymongo import MongoClient
from flask import Flask,render_template,request,session,abort,jsonify
from flask_cors import CORS,cross_origin
from flask_restful import Api,Resource
from flaskext.mysql import MySQL

app=Flask(__name__)
api=Api(app)
CORS(app)
'''
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
@app.route('/login')
def returnUsers():
    return "{user ='asdf', asdf = 'd'}";
app.run(debug=True)
'''
'''
books = [
    {'id': 0,
     'title': 'A Fire Upon the Deep',
     'author': 'Vernor Vinge',
     'first_sentence': 'The coldsleep itself was dreamless.',
     'year_published': '1992'},
    {'id': 1,
     'title': 'The Ones Who Walk Away From Omelas',
     'author': 'Ursula K. Le Guin',
     'first_sentence': 'With a clamor of bells that set the swallows soaring, the Festival of Summer came to the city Omelas, bright-towered by the sea.',
     'published': '1973'},
    {'id': 2,
     'title': 'Dhalgren',
     'author': 'Samuel R. Delany',
     'first_sentence': 'to wound the autumnal city.',
     'published': '1975'}
]

@app.route('/books', methods=['GET'])
def index():
    return jsonify(books)

app.run(debug=True)

'''


mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = ''
app.config['MYSQL_DATABASE_PASSWORD'] = None
app.config['MYSQL_DATABASE_DB'] = 'collegee'
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'
mysql.init_app(app)


conn = mysql.connect()
cursor =conn.cursor()

#cursor.execute("SELECT * FROM `signup_and_login_users_table` where username= ")
#()data = cursor.fetchone


@app.route("/")
def hello():
    return jsonify([{'text':'Hello World!'},{'text2':'hello'},{'text3':''}])

@app.route("/logincheck",methods=['GET'])
def logincheck():
    name= request.args.get('user')#.form['user']
    passw=request.args.get('pass')#.form['pass']
    query = "select * from signup_and_login_users_table where username='%s'"%(name)
    cursor.execute(query)
    data=list(cursor.fetchone())
    return jsonify([{'text':'Hello World!'},{'text2':query},{'text3':data[1]}])
#cursor.execute("SELECT * FROM `signup_and_login_users_table` where username='",name,"'")

#data = list(cursor.fetchone())
#return data[0]

class Employees(Resource):
    def get(self):
        return {'employees': [{'id':1, 'name':'Balram'},{'id':2, 'name':'Tom'}]}

class Employees_Name(Resource):
    def get(self, employee_id):
        print('Employee id:' + employee_id)
        result = {'data': {'id':1, 'name':'Balram'}}
        return jsonify(result)


api.add_resource(Employees, '/employees') # Route_1
api.add_resource(Employees_Name, '/employees/<employee_id>') # Route_3


if __name__ == '__main__':
   app.run(debug=True,port=5002)