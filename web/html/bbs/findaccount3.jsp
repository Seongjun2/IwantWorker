<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%!
    String cssDir = "css";
    String jsDir = "js";
    String imgDir = "imgs";
%>
<%
    String answer = request.getParameter("answer");
    String ctxPath = request.getContextPath();
    String tell = null;

    if ( session.getAttribute("uuid") != null ) {
        response.sendRedirect(ctxPath + "/index.jsp");
        return;
    }
    if ( ctxPath == null || tell == null || answer == null ) {
        response.sendRedirect(ctxPath + "/html/bbs/findaccount.jsp");
        return;
    }
    tell = (String)session.getAttribute("tell");
    UserDAO dao = new UserDAO_Impl();
    UserVO vo = null;
    try{
        vo = dao.getUserInfo2(tell);
    } catch (Exception e){}

%>

<%@include file="../header.jsp"%>
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<link rel="stylesheet" type="text/css" , href="<%=cssDir%>/findaccount.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">계정찾기</h3>
    </div>
    <div class="div_mainDiv">
        <h1></h1>
        <form method="post" action="findaccount2.jsp">
            <h4><%=vo.getQuestion()%></h4>
            <input type="text" name="answer"/>
            <input type="submit">
        </form>

    </div>
</main>
<%@include file="../footer.jsp"%>