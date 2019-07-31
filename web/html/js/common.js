window.addEventListener("click", function(e) {
	switch(e.target.id) {
		case 'header_sidebar':
		case 'main_header_menu_btn':
			document.getElementById('header_sidebar').style.transform = 'translate(0, -20%)';
			break;
		case 'main_header_search_text':
			document.getElementById('main_header_search_span').style.border = '3px solid #000000';
			document.getElementById('main_header_search_span').style.transform = 'translate(0, -3%)';
			document.getElementById('main_header_search_span').style.height = '61%';
			document.getElementById('main_header_search_span').style.width = '91%';
			break;
		default:
			document.getElementById('header_sidebar').style.transform = 'translate(-60vw, -20%)';
			document.getElementById('main_header_search_span').style.border = '0';
			document.getElementById('main_header_search_span').style.transform = 'translate(0, 0)';
			document.getElementById('main_header_search_span').style.height = '60%';
			document.getElementById('main_header_search_span').style.width = '90%';
	}
});