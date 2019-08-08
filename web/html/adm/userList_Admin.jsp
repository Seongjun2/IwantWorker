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
    String level = (String)session.getAttribute("user_level");

    if( level ==null ||!level.equals("10")){
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

    Paging paging = new Paging();
    paging.makeBlock(pageNum);
    int blockStartNum = paging.getBlockStartNum();
    int blockLastNum = paging.getBlockLastNum();
    paging.makeLastPageNum_userList();
    int lastPageNum = paging.getLastPageNum();


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
                <input id="user_search_text" type="text" name="search" placeholder="�̸��� �Է��ϼ���" onclick="onFocusSearch(<%=_uri%>)" />
            </form>
            <div id="main_search_icon">
                <img src="<%= imgDir %>/lenz.png" />
            </div>
        </span>
    </div>
    <div class="div_pageName">
        <h3 class="h3_pageName">ȸ����� ��ȸ</h3>
    </div>
    <div class="div_mainDiv">
        <table id = "userTable">
            <thead align="center">
                <tr>
                    <th>��ȣ</th>
                    <th>�̸�</th>
                    <th>����ó</th>
                    <th>����</th>
                </tr>
            </thead>
            <%
                if(searchName == null || searchName.equals("")){%>
                <%@include file="./tbody_totalUsers.jsp"%>
            <%
                }else{%>
                <%@include file="./tbody_searchUser.jsp"%>
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
    <script type="text/javascript" src="../js/userList.js"></script>
</html>