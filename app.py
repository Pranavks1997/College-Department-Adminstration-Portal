from flask import Flask,render_template,Request,session

app=Flask(__name__)

@app.route('/')
def index():
    return render_template('home.html')

#@app.route('/')

app.run(debug=True)
