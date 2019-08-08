function check_PW() {
    var pw = document.getElementById('pw').value;
    var pw_check = document.getElementById('pw_check').value;

    if(pw != pw_check){
        alert("비밀번호가 일치하지 않습니다.");
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

function leave() {
    confirm("정말로 회원탈퇴 하시겠습니까? 삭제된 계정은 복구할 수 없습니다.");
}

window.onload = function(){
    var question = document.getElementById("hidden_question").value;
    var selects = document.getElementsByName("questions")[0];

    for(var i = 0; i< selects.length;i++){
        if(selects[i].value == question){
            selects.selectedIndex = i;
            break;
        }
    }
}