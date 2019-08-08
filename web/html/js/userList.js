function disFocusSearch(uri) {
    var user_search_text = document.getElementById("user_search_text").value;

    console.log(user_search_text);
    if(user_search_text == ""){//다시 해야함.
        location.href(uri);
    }
    else{
        location.href(uri+"?search="+user_search_text);
    }

}