from flask import Flask, jsonify, request
from db import Note, noteTablesCreate, createNote, readAllNotes     ###
from db import search, updateNote, deleteNote, readNoteById         ###
from flask_cors import CORS, cross_origin  ### 1
noteTablesCreate()                                                  ###
app = Flask(__name__) ### 2
CORS(app)  ### 3

@app.route('/notes',methods=['POST']) #POST /notes  + json_body
@cross_origin()  ### 4 apply all fns
def notes_create():
    body = request.get_json()
    new_note = Note(title=body['title'], notes=body['notes']) ###
    id = createNote(new_note)
    note = readNoteById(id)
    note_dict = {'id':note.id, 'title':note.title, 'notes':note.notes}
    return jsonify(note_dict)

@app.route('/notes/<id>',methods=['GET'])
@cross_origin()
def notes_read_by_id(id):
    note = readNoteById(id)
    note_dict = {'id':note.id, 'title':note.title, 'notes':note.notes}
    return jsonify(note_dict)

@app.route('/notes',methods=['GET'])
@cross_origin()
def notes_read_all():
    notes = readAllNotes()
    notes_dict = []
    for note in notes:
        notes_dict.append({'id':note.id, 'title':note.title, 'notes':note.notes})
    return jsonify(notes_dict)

@app.route('/notes/<id>',methods=['PUT'])
@cross_origin()
def notes_update(id):
    body = request.get_json()
    old_note = readNoteById(id)
    if not old_note:
        return jsonify({'message': 'Note is not found'})
    old_note.title = body['title']
    old_note.notes = body['notes']
    updateNote(old_note)
    note = readNoteById(id)
    note_dict = {'id':note.id, 'title':note.title, 'notes':note.notes}
    return jsonify(note_dict)

@app.route('/notes/<id>',methods=['DELETE'])
@cross_origin()
def notes_delete(id):
    old_note = readNoteById(id)
    if not old_note:
        return jsonify({'message': 'Note is not found', 'is_error': 1})
    deleteNote(id)
    return jsonify({'message': 'Note is successfully deleted', 'is_error': 0})

@app.route('/notes_search',methods=['POST'])
@cross_origin()
def notes_search():
    body = request.get_json()
    notes = search(body.get('title',''), body.get('notes_text',''))
    notes_dict = []
    for note in notes:
        notes_dict.append({'id':note.id, 'title':note.title, 'notes':note.notes})
    return jsonify(notes_dict)