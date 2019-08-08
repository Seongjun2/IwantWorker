let bannerCount = 1;
setInterval(function () {
    if(document.getElementById('banner_'+(bannerCount+1)) == null) {
        bannerCount = 1;
        document.getElementById('new_main_banner_div').style.transform = 'translate(0, 0)';
    } else {
        document.getElementById('new_main_banner_div').style.transform = 'translate(-'+(bannerCount*100)+'vw, 0)';
        bannerCount++;
    }
}, 10000);