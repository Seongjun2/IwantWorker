window.onload = function(){
    var status = document.getElementById("hidden_status").value;
    var selects = document.getElementById("paystate");

    for(var i = 0; i< selects.length;i++){
        if(selects[i].value == status){
            selects.selectedIndex = i;
            break;
        }
    }
}

function filterState( uri ) {
    var state = $("#paystate > option:selected").val();
    if (state) location.href = uri + "?status=" + state;
    else location.href = uri;
}