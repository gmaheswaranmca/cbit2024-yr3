from flask import Flask, render_template
from db import noteTablesCreate#
from db import readAllNotes#

noteTablesCreate()#      #if db not there, creates db. if no tbl, creates it.
app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')
@app.route("/create")
def create_notes():
    return render_template('create.html')
@app.route("/list", methods=["GET"]) #
def list_notes():
    notes = readAllNotes()#
    return render_template('list.html', notes = notes)#
@app.route("/view/<id>")
def view_notes(id):
    return render_template('view.html')
@app.route("/edit/<id>")
def edit_notes(id):
    return render_template('edit.html')


'''
       route                menu            template      handler
    1. /                    "search notes"  index.html    index()
    2. /create              "new notes"     create.html   create_notes()
    3. /list                "all notes"     list.html     list_notes()
    4. /view/<id>           "view notes"    view.html     view_notes(id)
    5. /edit/<id>           "edit notes"    edit.html     edit_notes(id)             
'''