window.addEventListener("click", function(e) {
	var id = e.target.id;
	if(id === 'main_header_search_text') {
		document.getElementById('main_header_search_span').style.border = '3px solid #000000';
		document.getElementById('main_header_search_span').style.transform = 'translate(0, -3%)';
		document.getElementById('main_header_search_span').style.height = '61%';
		document.getElementById('main_header_search_span').style.width = '91%';
	} else {
		document.getElementById('main_header_search_span').style.border = '0';
		document.getElementById('main_header_search_span').style.transform = 'translate(0, 0)';
		document.getElementById('main_header_search_span').style.height = '60%';
		document.getElementById('main_header_search_span').style.width = '90%';	
	}
});

window.onload = function () {
    document.getElementById('main_header_menu_btn_area').onclick = function() {
        document.getElementById('header_sidebar').style.transform = 'translate(0, -350px) rotate(.001deg)';
        document.getElementById('header_sidebar_blank').style.display = 'block';
        document.body.style['overflow-y'] = 'hidden';
    }
	document.getElementById('header_sidebar_blank').onclick = function() {
		document.getElementById('header_sidebar').style.transform = 'translate(-60vw, -350px) rotate(.001deg)';
		document.getElementById('header_sidebar_blank').style.display = 'none';
		document.body.style['overflow-y'] = 'scroll';
	}
}