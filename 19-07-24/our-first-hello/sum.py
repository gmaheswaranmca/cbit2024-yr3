from flask import Flask
app = Flask(__name__)

@app.route("/sum/<first>/<second>")
def calc_sum(first, second):
    s = int(first) + int(second) 
    return f"<p>The sum of {first} and {second} is <strong>{s}</strong></p>"