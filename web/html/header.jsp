<%@ page import="routes.Router" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="VO.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%

    UserDAO userDAO = new UserDAO_Impl();
    UserVO userVO = null;
    boolean isUser = false;
    if(session.getAttribute("uuid") != null) {
        isUser = true;
        try {
            userVO = userDAO.getUserInfo((Integer) session.getAttribute("uuid"));
        } catch (Exception e) {
            out.print("<script>alert('잘못된 접근입니다');</script>");
            response.sendRedirect("");
            return;
        }
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
                    <span id="header_sidebar_user_name"><%=userVO.getName()%>님</span>
                    <span id="header_sidebar_user_point"><%=userVO.getPoint()%> 한라봉</span>
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
            <a href="<%= router.mypage.modify_myInfo %>"><li>내정보 수정</li></a>
            <a href="<%= router.board.board_list %>"><li>게시판</li></a>
            <a href="<%= router.mypage.my_posts %>"><li>나의 글</li></a>
            <a href="<%= router.mypage.pay_list %>"><li>결제 내역</li></a>
            <a href="<%= router.mypage.point_list %>"><li>포인트 내역</li></a>
            <a href="<%=__PATH__%>/bbs/logout.jsp"><li>로그아웃</li></a>
            <% } else { %>
            <a href="<%=__PATH__%>/bbs/login.jsp"><li>로그인</li></a>
            <% } %>
        </ul>
    </div>
    <div id="header_sidebar_blank" onclick="hideSideBar()"></div>
</header>