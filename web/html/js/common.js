window.onload = () => {
	document.getElementById('main_header_menu_btn').onclick = function() {
		document.getElementById('header_sidebar').style.transform = 'translate(0, -20%)';
		document.getElementById('header_sidebar_blank').style['z-index'] = '1';
	}
	document.getElementById('header_sidebar_blank').onclick = function() {
		document.getElementById('header_sidebar').style.transform = 'translate(-60vw, -20%)';
		document.getElementById('header_sidebar_blank').style['z-index'] = '-1';
	}
}