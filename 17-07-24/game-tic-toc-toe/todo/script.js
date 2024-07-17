var todos = [];
function addToDo(){
    const todoBox = document.getElementById("todo");
    todos.push(todoBox.value);
    display();
}
function deleteToDo(index){
    todos.splice(index,1); //from index we delete 1 item 
    display()
}
function display(){
    let rows = '';
    let I = 1;
    for(let item of todos){
        rows += `<tr><td>${I}</td><td>${item}<button 
            class="btn btn-warning"
            onclick="deleteToDo(${I-1})">delete</button></td></tr>`
        I++;
    }
    let table = `<table class="table">
        <tr><th>#</th><th>todo item</th></tr>
        ${rows}
    </table>`
    const todoListTag = document.getElementById("todo-list");
    todoListTag.innerHTML = table;
    const todoBox = document.getElementById("todo");
    todoBox.value = "";
    todoBox.focus();
}