function login() {
    var tell = document.getElementById("tell");
    var pw = document.getElementById("pw");
    if ( tell.value == "admin" && pw.value == "admin" ) {
        alert('로그인에 성공하였습니다.');
        document.getElementById("login_form").submit();
        return;
    }

    if ( tell.value.indexOf(" ") != -1 || pw.value.indexOf(" ") != -1 ) {
        alert("공백은 입력할수 없습니다.");
        event.preventDefault();
        return;
    } else if ( isNaN(tell.value) ) {
        alert("전화번호에는 숫자만 입력이 가능합니다.");
        event.preventDefault();
        return;
    } else if ( tell.value == "" || pw.value == ""){
        alert("빈칸은 입력할 수 없습니다.");
        event.preventDefault();
        return;
    } else if ( tell.value.length != 11 ) {
        alert("전화번호 11자리를 입력해주세요");
        event.preventDefault();
        return;
    }
    else {
        document.getElementById("login_form").submit();
    }
};
function login_enter(event) {
    if ( event.code === 'Enter' || event.code === 'NumpadEnter' ) {
        login();
    }
};
