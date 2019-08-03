<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<%!
    String cssDir = "../css";
    String jsDir = "../js";
    String imgDir = "../imgs";
%>
<%
    String uuid = null;
    uuid = request.getParameter("uuid");
    if(uuid == null) {
        response.sendRedirect("./userList_Admin.jsp");
        return;
    }

    UserDAO dao = new UserDAO_Impl();
    UserVO vo = dao.getUserInfo(Integer.parseInt(uuid));
    session.setAttribute("vo", vo);
%>
<html>
<head>
    <title>ModifyInfo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="../imgs/favicon.png">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/main.css">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/common.css">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/userInfo_modify.css">
    <script type="text/javascript" src="<%= jsDir %>/common.js"></script>
    <link rel="stylesheet" type="text/css", href="../css/userList.css">
    <script type="text/javascript" src="../js/common.js"></script>
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

<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">회원정보 수정</h3>
    </div>
    <div class="div_mainDiv">
        <form action="./userInfoUpdate.jsp" method="get">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                <input type="text" class="input_userInfo" name="tell" value="<%=vo.getTell()%>"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">이름</p>
                <p id ="p_name"><%=vo.getName()%></p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">변경할 비밀번호</p>
                <input type="password"  class="input_userInfo" name="pw"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">변경할 비밀번호 확인</p>
                <input type="password"  class="input_userInfo" name="pw_check"/>
            </div>

            <div id = "div_submit">
                <input id = "input_submit" type="submit" value="변경하기"/>
            </div>

        </form>
    </div>
</main>

<footer>
    <div><img src="../imgs/logo.png" /></div>
    <span>COPYRIGHT LeagueLugas, ALL RIGHT RESERVED.</span>
    <button id="change_device">PC 버전으로 보기</button>
</footer>
</body>
</html>