
function check_PW() {
    var pw = document.getElementById('pw').value;
    var pw_check = document.getElementById('pw_check').value;

    if(pw != pw_check){
        alert("비밀번호가 틀립니다.");
        event.preventDefault();
    }
}