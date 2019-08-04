function check_PW() {
    var pw = document.getElementById('pw').value;
    var pw_check = document.getElementById('pw_check').value;

    if(pw != pw_check){
        alert("비밀번호가 틀립니다.");
        event.preventDefault();
    }
}

function NumObj(obj){

    if (event.keyCode >= 48 && event.keyCode <= 57) {

    }else{

        event.returnValue = false;

    }

}
function SetNum(obj){
    val=obj.value;
    re=/[^0-9]/gi;
    obj.value=val.replace(re,"");

}