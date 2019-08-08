function filterState( uri ) {
    var state = $("#paystate > option:selected").val();
    if (state) location.href = uri + "?status=" + state;
    else location.href = uri;
}