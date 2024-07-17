var count = 0;
function increment() { 
    const offset_box = document.getElementById("offset");
    count += +offset_box.value; 
    document.getElementById('counter').innerHTML = count;
}
function decrement() { 
    if(count<=0){return;} 
    const offset_box = document.getElementById("offset");
    count -= +offset_box.value; 
    document.getElementById('counter').innerHTML = count;
}