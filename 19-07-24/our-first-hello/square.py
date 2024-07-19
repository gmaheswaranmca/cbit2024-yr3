from flask import Flask, render_template, request
app = Flask(__name__)

@app.route("/square",methods=["GET","POST"])
def calc_square():
    num = 0
    square = 0

    if request.method == "POST":
        num = int(request.form['num'])
        square = num ** 2

    return render_template("square.html",
        num = num, square = square)