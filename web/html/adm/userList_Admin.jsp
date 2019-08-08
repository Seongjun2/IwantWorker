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
    Integer level = (Integer)session.getAttribute("user_level");

    if( level == null || level != 10){
        response.sendRedirect(Router.getInstance(request.getContextPath()).main.index);
    }
    String _uri = request.getRequestURI();
    String searchName = null;
    searchName = request.getParameter("search");
    String pageNumString = request.getParameter("pageNum");

    int pageNum = 0;
    if(pageNumString == null){
        pageNum = 1;
    }
    else{
        pageNum = Integer.parseInt(pageNumString);
    }

    Paging paging = null;
    UserDAO userDAO2 = new UserDAO_Impl();
    List<UserVO> userList = null;
    if(searchName == null || searchName.equals("")){
        userList = userDAO2.getUsers();
        paging = new Paging(pageNum, userList.size());
    }
    else{
        userList = userDAO2.getSearchInfo(searchName);
        System.out.println(userList.size());
        paging = new Paging(pageNum, userList.size());
    }

%>
<html>
<head>
    <title>userList</title>
</head>
<body>
<%@include file="../header.jsp"%>
<main>
    <div id="main_search">
        <span id="main_search_span">
            <form id="main_search_form">
                <input id="user_search_text" type="text" name="search" placeholder="이름을 입력하세요" onclick="onFocusSearch(<%=_uri%>)" />
            </form>
            <div id="main_search_icon">
                <img src="<%= imgDir %>/lenz.png" />
            </div>
        </span>
    </div>
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
<%--            <%--%>
<%--                if(searchName == null || searchName.equals("")){%>--%>
<%--                <%@include file="./tbody_totalUsers.jsp"%>--%>
<%--            <%--%>
<%--                }else{%>--%>
<%--                <%@include file="./tbody_searchUser.jsp"%>--%>
<%--            <%--%>
<%--                }--%>
<%--            %>--%>
            <%@include file="./tbody_totalUsers.jsp"%>
        </table>
    </div>
</main>
<jsp:include page="../pagination.jsp">
    <jsp:param name="pageNum" value="<%= pageNum %>"/>
    <jsp:param name="lastPageNum" value="<%= paging.getLastPageNum() %>"/>
</jsp:include>
<%@include file="../footer.jsp"%>
</body>
    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/userList.css">
<link rel="stylesheet" type="text/css", href="<%=cssDir%>/main.css">
    <script type="text/javascript" src="../js/pagination_admin.js"></script>
    <script type="text/javascript" src="../js/userList.js"></script>
</html>