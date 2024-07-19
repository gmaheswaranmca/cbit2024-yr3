from flask import Flask, render_template
app = Flask(__name__)

@app.route("/sum/<first>/<second>")
def calc_sum(first, second):
    first = int(first)
    second = int(second)
    s = first + second 
    return render_template("sum.html",
        first = first, second = second, sum = s)