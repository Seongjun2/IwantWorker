<%@ page import="routes.Router" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    boolean isUser = false;
    HttpSession sesssion = request.getSession();
    if(session.getAttribute("user_id") != null) {
        isUser = true;
    }

    Router router = Router.getInstance(request.getContextPath());
    String __PATH__ = request.getContextPath()+"/html";
    String cssDir = __PATH__+"/css";
    String jsDir = __PATH__+"/js";
    String imgDir = __PATH__+"/imgs";
%>
<html>
<head>
    <title>Jeju</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=0" />
    <link rel="shortcut icon" href="<%= imgDir %>/favicon.png">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/common.css">
    <script type="text/javascript" src="<%= jsDir %>/common.js"></script>
</head>
<body>
<header id="header">
    <div id="header_menu">
        <div id="header_menu_btn_area" onclick="showSideBar()">
            <img id="header_menu_btn" src="<%= imgDir %>/main_menu_btn.png">
        </div>
        <img id="header_menu_logo" src="<%= imgDir %>/logo.png" onclick="location.href='<%=__PATH__%>/index.jsp'"/>
    </div>
    <div id="header_sidebar">
        <div id="header_sidebar_close" onclick="hideSideBar()">
            <img src="<%= imgDir %>/close_icon.png">
        </div>
        <div id="header_sidebar_user">
            <div id="header_sidebar_user_icon">
                <img src="<%= imgDir %>/user_icon.png" />
            </div>
            <div id="header_sidebar_user_info">
                <div>
                    <% if(isUser) { %>
                    <span id="header_sidebar_user_name">임용성님</span>
                    <span id="header_sidebar_user_point">1000 한라봉</span>
                    <a href="<%=__PATH__%>/bbs/shop.jsp"><button>충전하기</button></a>
                    <% } else { %>
                    <span></span>
                    <span>로그인을 해주세요</span>
                    <% } %>
                </div>
            </div>
        </div>
        <ul id="header_sidebar_menu">
            <% if(isUser) { %>
            <li>
                <a href="<%= router.mypage.modify_myInfo %>">내정보 수정</a>
            </li>
            <li>
                <a href="<%= router.board.board_list %>">게시판</a>
            </li>
            <li>
                <a href="<%= router.mypage.my_posts %>">나의 글</a>
            </li>
            <li>
                <a href="<%= router.mypage.pay_list%>">결제내역</a>
            </li>
            <li>
                <a href="<%= router.mypage.point_list %>"> 포인트 내역 </a>
            </li>
            <li>로그아웃</li>
            <% } else { %>
            <a href="<%=__PATH__%>/bbs/login.jsp"><li>로그인</li></a>
            <% } %>
        </ul>
    </div>
    <div id="header_sidebar_blank" onclick="hideSideBar()"></div>
</header>