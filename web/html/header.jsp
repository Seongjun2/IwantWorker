<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Jeju</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="./imgs/favicon.png">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/main.css">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/common.css">
    <script type="text/javascript" src="<%= jsDir %>/common.js"></script>
</head>
<body>
<header id="main_header">
    <div id="main_header_menu">
        <div id="main_header_menu_btn_area">
            <img id="main_header_menu_btn" src="<%= imgDir %>/main_menu_btn.png">
        </div>
        <img id="main_header_menu_logo" src="<%= imgDir %>/logo.png" />
    </div>
    <div id="main_header_search">
			<span id="main_header_search_span">
				<form id="main_header_search_form">
					<input id="main_header_search_text" type="text" name="search" placeholder="검색어를 입력하세요" />
				</form>
				<div id="main_header_search_icon">
					<img src="<%= imgDir %>/lenz.png" />
				</div>
			</span>
    </div>
    <div id="header_sidebar">
        <img src="<%= imgDir %>/close_icon.png">
        <div id="header_sidebar_user">
            <div id="header_sidebar_user_icon">
                <img src="<%= imgDir %>/user_icon.png" />
            </div>
            <div id="header_sidebar_user_info">
                <div>
                    <span id="header_sidebar_user_name">임용성님</span>
                    <span id="header_sidebar_user_point">1000 한라봉</span>
                    <button>충전하기</button>
                </div>
            </div>
        </div>
    </div>
    <div id="header_sidebar_blank" onclick="hideMenu()"></div>
</header>