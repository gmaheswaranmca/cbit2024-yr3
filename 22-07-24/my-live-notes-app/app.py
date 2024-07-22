from flask import Flask, render_template, redirect, request #### 2
from db import noteTablesCreate#
from db import Note, readAllNotes, createNote# #### 2
from db import updateNote, readNoteById, deleteNote, search ###3

noteTablesCreate()#      #if db not there, creates db. if no tbl, creates it.
app = Flask(__name__)

@app.route("/", methods=['GET','POST'])
def index():
    if request.method == 'GET':
        return render_template('index.html',
                menu = 'search')
    elif request.method == 'POST':
        title = request.form['title']
        notes_text = request.form['notes']
        notes = search(title, notes_text)#do search here
        for I in range(len(notes)):
            notes[I].sno = I + 1
        return render_template('list.html', 
                notes = notes,
                menu = 'list')#


@app.route("/list", methods=["GET"]) #
def list_notes():
    notes = readAllNotes()#
    for I in range(len(notes)):
        notes[I].sno = I + 1
    return render_template('list.html', 
        notes = notes,
        menu = 'list')#
@app.route("/create",methods=['GET','POST'])
def create_notes():         ####
    note = Note()
    if request.method == 'POST':
        note.title = request.form['title']
        note.notes = request.form['notes']
        createNote(note)
        return redirect('/list')
    elif request.method == 'GET':
        return render_template('create.html',
            menu = 'create')  
@app.route("/list/view/<id>",methods=['GET'])
def view_notes(id):
    note = readNoteById(id)
    return render_template('view.html',
            note=note,
            menu = 'list')
@app.route("/list/edit/<id>",methods=['GET','POST'])
def edit_notes(id):
    note = readNoteById(id)
    if request.method == 'GET':        
        return render_template('edit.html',
                note=note,
                menu = 'list')
    elif request.method == 'POST':
        note.title = request.form['title']
        note.notes = request.form['notes']
        updateNote(note)
        return redirect('/list')
@app.route("/delete",methods=['POST'])
def delete_notes():
    if request.method == 'POST':
        id = request.form['id']
        deleteNote(id)
        return redirect('/list')




'''
@app.route("/test", methods=["GET"]) #
def test():
    return render_template('test-list.html')#


'''


'''
       route                menu            template      handler
    1. /                    "search notes"  index.html    index()
    2. /create              "new notes"     create.html   create_notes()
    3. /list                "all notes"     list.html     list_notes()
    4. /view/<id>           "view notes"    view.html     view_notes(id)
    5. /edit/<id>           "edit notes"    edit.html     edit_notes(id)             
'''