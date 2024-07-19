from flask import Flask
app = Flask(__name__)

@app.route("/hello")
def hello_friend():
    return "<h2>hello friend</h2>"


@app.route("/hi/<name>")
def hi_friend(name):
    return f"<h2>hi {name}</h2>"