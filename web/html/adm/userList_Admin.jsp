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
    String pageNumString = request.getParameter("pageNum");

    int pageNum = 0;
    if(pageNumString == null){
        pageNum = 1;
    }
    else{
        pageNum = Integer.parseInt(pageNumString);
    }

    Paging paging = new Paging();
    paging.makeBlock(pageNum);
    int blockStartNum = paging.getBlockStartNum();
    int blockLastNum = paging.getBlockLastNum();
    paging.makeLastPageNum_userList();
    int lastPageNum = paging.getLastPageNum();

    UserDAO userDao = new UserDAO_Impl();
    List<UserVO> userList = userDao.getUsers();
    int i = ((pageNum-1) * 10)+1;
    int lastIdx = 0;
    int startIdx = i-1;

    if(pageNum == lastPageNum) lastIdx = userList.size();
    else{
        lastIdx = startIdx+10;
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
                <input id="user_search_text" type="text" name="search" placeholder="검색어를 입력하세요" onclick="onFocusSearch()" />
            </form>
            <div id="main_search_icon">
                <img src="<%= imgDir %>/lenz.png" />
            </div>
        </span>
        <div id="search_blank" onclick="disFocusSearch()"></div>
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
            <%
                if(userList.size() > 0 ){%>
            <%@include file="./tbody_totalUsers.jsp"%>
            <%
                }
            %>

        </table>
    </div>
</main>
<%@include file="../pagination.jsp"%>
<%@include file="../footer.jsp"%>
</body>
    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/userList.css">
<link rel="stylesheet" type="text/css", href="<%=cssDir%>/main.css">
    <script type="text/javascript" src="../js/pagination_admin.js"></script>
</html>