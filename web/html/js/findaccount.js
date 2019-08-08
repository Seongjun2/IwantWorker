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
    var tell = document.getElementById("tell");
    var pw = document.getElementById("pw");
    var name = document.getElementById("name");
    var answer = document.getElementById("answer");

    if ( tell.value.indexOf(" ") != -1 || pw.value.indexOf(" ") != -1 || name.value.indexOf(" ") != -1 || answer.value.indexOf(" ") != -1) {
        alert("공백은 입력할수 없습니다.");
        event.preventDefault();
        return;
    } else if (isNaN(tell.value)) {
        alert("전화번호에는 숫자만 입력이 가능합니다.");
        event.preventDefault();
        return;
    } else if (tell.value == "" || name.value == "" || pw.value == "" || answer.value == "") {
        alert("빈칸은 입력할 수 없습니다.");
        event.preventDefault();
        return;
    } else if (tell.value.length != 11) {
        alert("전화번호 11자리를 입력해주세요");
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