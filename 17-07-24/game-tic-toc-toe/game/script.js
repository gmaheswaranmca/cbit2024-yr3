var cells = ['','','',    '','','',   '','',''];
var turn = 'X';
function clear() {
    cells = ['','','',   '','','',    '','',''];
    loadBoard();
}
function loadBoard() {
    for(let I =0 ; I < 9; I++) {
        const box_name = "box" + (I+1);
        const box_tag = document.getElementById(box_name);
        box_tag.innerHTML = cells[I];
    }
    document.getElementById("turn").innerHTML = turn;
}
function play(event) {
    const box_id = event.target.id;
    const box_index = parseInt(box_id[box_id.length-1]) - 1;
    if(cells[box_index] != '') return;
    cells[box_index] = turn;
    turn = turn == 'X' ? 'O' : 'X';
    loadBoard()
}