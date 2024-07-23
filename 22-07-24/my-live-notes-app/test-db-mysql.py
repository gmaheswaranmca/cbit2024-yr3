from db import noteTablesCreate, createNote, readAllNotes, Note

noteTablesCreate()

notes_list = [
    ['django','web development frameowork in python'],
    ['mysql','leading RDBMS and highly reliable db']
]
notes_list = [] # to skip 
for e in notes_list:
    id = createNote(Note(title=e[0],notes=e[1]))
    print(f'{id} is inserted')

notes = readAllNotes()
print(notes)

