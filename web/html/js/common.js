function showSideBar() {
    document.getElementById('header_sidebar').style.transform = 'translate(0, -351.5px) rotate(.001deg)';
    document.getElementById('header_sidebar_blank').style.display = 'block';
    document.body.style['overflow-y'] = 'hidden';
}

function hideSideBar() {
    document.getElementById('header_sidebar').style.transform = 'translate(-60vw, -351.5px) rotate(.001deg)';
    document.getElementById('header_sidebar_blank').style.display = 'none';
    document.body.style['overflow-y'] = 'scroll';
}