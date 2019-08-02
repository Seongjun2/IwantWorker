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
<html>
<head>
    <title>userList</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="../imgs/favicon.png">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/main.css">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/common.css">
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
        <h3 class="h3_pageName">회원목록 조회</h3>
    </div>
    <div class="div_mainDiv">
        <table id = "userTable">
            <thead align="center">
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>연락처</th>
                    <th>수정</th>
                </tr>
            </thead>
            <tbody align="center">
            <%
                UserDAO userDao = new UserDAO_Impl();
                List<UserVO> userList = userDao.findAll();
                for(UserVO vo : userList){
            %>
            <tr>
                <td> <%=vo.getUuid()%></td>
                <td> <%=vo.getName()%></td>
                <td> <%=vo.getTell()%></td>
<%--                <td><input type="button" value = "수정" class="btn_modify"/></td>--%>
                <td>
                    <form action="./modify_userInfo_admin.jsp?uuid=<%=vo.getUuid()%>" method="post">
                        <input type="submit" value = "수정" class="btn_modify">
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</main>

<footer>
    <div><img src="../imgs/logo.png" /></div>
    <span>COPYRIGHT LeagueLugas, ALL RIGHT RESERVED.</span>
    <button id="change_device">PC 버전으로 보기</button>
</footer>
</body>
</html>