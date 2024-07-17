function findSquare() {
    const num_box = document.getElementById('num');
    const result_box = document.getElementById('result');
    const answer_tag = document.getElementById('answer');
    const label_tag = document.getElementById('label_result');
    const num = parseInt(num_box.value);
    const result = num * num;
    result_box.value = result;
    answer_tag.innerHTML = `square of ${num} is ${result}`;
    label_tag.innerHTML = "Square"
}
function findCube() {
    const num_box = document.getElementById('num');
    const result_box = document.getElementById('result');
    const answer_tag = document.getElementById('answer');
    const label_tag = document.getElementById('label_result');
    const num = parseInt(num_box.value);
    const result = num * num * num;
    result_box.value = result;
    answer_tag.innerHTML = `cube of ${num} is ${result}`;
    label_tag.innerHTML = "Cube"
}