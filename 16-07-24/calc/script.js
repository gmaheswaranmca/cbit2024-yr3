var first='', second='', operator='';
function doCalc(val) {
    if(val == '/' || val == '*' || val == '-' || val == '+') {
        operator = val;
    } else if(val == '='){
        let ifirst = parseInt(first), isecond=parseInt(second);
        switch(operator) {
            case '/': first = parseInt(ifirst / isecond); break;
            case '*': first = ifirst * isecond; break;
            case '-': first = ifirst - isecond; break;
            case '+': first = ifirst + isecond; break;
        }
        second = ''; operator = '';
    } else if(val == 'C') { first = ''; second = ''; operator = ''; }
    else {
        if(operator == '') {
            first += val;
        } else {
            second += val;
        }
    } 
    const answer_box = document.getElementById('answer_box');
    let result = first + ' ' + operator + ' ' + second;
    result = result.trim();
    result = result == '' ? '0' : result;
    answer_box.value = result;
}