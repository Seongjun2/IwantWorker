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
    String tell = request.getParameter("tell");
    String ctxPath = request.getContextPath();

    if ( session.getAttribute("uuid") != null ) {
        response.sendRedirect(ctxPath + "/index.jsp");
        return;
    }
    if ( ctxPath == null || tell == null ) {
        response.sendRedirect(ctxPath + "/html/bbs/findaccount.jsp");
        return;
    }
    UserDAO dao = new UserDAO_Impl();
    UserVO vo = null;
    try{
        vo = dao.getUserInfo2(tell);
        session.setAttribute("tell", tell);
        return;
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
        <h1>질문에 답변해주세요</h1>
        <form method="post" action="findaccount2.jsp">
            <h4><%=vo.getQuestion()%></h4>
            <input type="text" name="answer"/>
            <input type="submit">
        </form>

    </div>
</main>
<%@include file="../footer.jsp"%>