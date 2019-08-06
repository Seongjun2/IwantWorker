var bannerCount = 1;
setInterval(function () {
    if(document.getElementById('banner_'+(bannerCount+1)) == null) {
        bannerCount = 1;
        document.getElementById('main_head_div').style.transform = 'translate(0, 0)';
    } else {
        document.getElementById('main_head_div').style.transform = 'translate(-'+(bannerCount*100)+'%, 0)';
        bannerCount++;
    }
}, 10000);

function onFocusSearch() {
    document.getElementById('main_search_span').style.border = '3px solid #000000';
    document.getElementById('main_search_span').style.transform = 'translate(0, -3%)';
    document.getElementById('main_search_span').style.height = '61%';
    document.getElementById('main_search_span').style.width = '91%';
}
function disFocusSearch() {
    document.getElementById('main_search_span').style.border = '0';
    document.getElementById('main_search_span').style.transform = 'translate(0, 0)';
    document.getElementById('main_search_span').style.height = '60%';
    document.getElementById('main_search_span').style.width = '90%';
}