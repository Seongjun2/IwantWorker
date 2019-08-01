var bannerCount = 1;
function bannerSlide() {
    if(document.getElementById('banner_'+(bannerCount+1)) == null) {
        bannerCount = 1;
        document.getElementById('main_head_div').style.transform = 'translate(0, 0)';
    } else {
        document.getElementById('main_head_div').style.transform = 'translate(-'+(bannerCount*100)+'%, 0)';
        bannerCount++;
    }
}
setInterval('bannerSlide()', 10000);