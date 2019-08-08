function max_length( event ) {
    if ( event.keyCode === 9 || event.keyCode === 13 || event.keyCode === 116 || event.keyCode === 17 || event.keyCode === 8 || event.keyCode === 16 ) {
        return true;
    }
    if (document.getElementById("text").value.length >=  11 ) {
        return false;
    } else {
        return true;
    }
}
function  submit() {
    var answer = document.getElementById("text");

    if ( answer.value.indexOf(" ") != -1) {
        alert("공백은 입력할수 없습니다.");
        event.preventDefault();
        return;
    } else if ( answer.value == "") {
        alert("빈칸은 입력할 수 없습니다.");
        event.preventDefault();
        return;
    } else {
        document.getElementById("login_form").submit();
    }

}
function submit_enter (event) {
    if ( event.code === 'Enter' || event.code === 'NumpadEnter' ) {
        submit();
    }
};