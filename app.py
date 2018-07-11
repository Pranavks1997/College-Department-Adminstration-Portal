from flask import Flask,render_template,request,session,abort

app=Flask(__name__)

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/home', methods=["GET", "POST"])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        return render_template('home.html',username=username,password=password)


app.run(debug=True)
