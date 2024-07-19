from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/dravid")
def dravid_handler():
    return "<h1>I am rahul dravid</h1>"

@app.route("/greet")
def gree_all():
    return f'''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello App | Greet</title>
</head>
<body>    
    <h1>Hello App</h1>
    <h3>Greetings...</h3>
    <p>Greeting to all!!!</p>
</body>
</html>'''