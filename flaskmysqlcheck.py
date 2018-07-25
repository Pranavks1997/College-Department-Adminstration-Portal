from flaskext.mysql import MySQL
from flask import Flask,render_template,request,session,abort
app = Flask(__name__)

app.config(MYSQL_DATABASE_DB) = "collegee"
mysql = MySQL()
mysql.init_app(app)
cursor = mysql.get_db().cursor()
for i in cursor:
    print(i)