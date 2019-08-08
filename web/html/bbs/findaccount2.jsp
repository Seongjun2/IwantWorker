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
        response.sendRedirect(ctxPath + "/html/index.jsp");
        return;
    }
    if ( ctxPath == null || tell == null ) {
        response.sendRedirect(ctxPath + "/html/bbs/findaccount.jsp");
        return;
    }
    UserDAO dao = new UserDAO_Impl();
    UserVO vo = null;
    try {
        vo = dao.getUserInfo2(tell);
        session.setAttribute("tell", tell);
    } catch (Exception e){
    }
    if ( vo == null ){
        out.print("<script>alert('등록된 전화번호가 없습니다.');</script>");
        out.print("<script>location.href=\"" + ctxPath + "/html/bbs/findaccount.jsp\";</script>");
        return;
    }


%>

<%@include file="../header.jsp"%>
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<link rel="stylesheet" type="text/css" , href="<%=cssDir%>/findaccount.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">계정찾기</h3>
    </div>
    <div class="div_mainDiv">
        <h1 style="font-size: 3.5em">질문에 답변해주세요</h1>
        <form method="post" action="findaccount3.jsp">
            <p style="font-size: 3em">질문:<%=vo.getQuestion()%></p>
            <input  style="
    font-size: 4em;
    text-align: center;
    width: 100%;
    height: 10%;
    margin-bottom: 1em;
    border-radius: 30px;" type="text" placeholder="답변을 입력해 주세요" name="answer"/>
            <input type="submit" style="
    font-size: 3em;
    text-align: center;
    width: 100%;
    height: 10%;
    margin-bottom: 1em;
    background: #ec8032;
    color: #ffffff;
    border-radius: 30px;" >
        </form>
        <h1 style="font-size: 3.5em">관리자에게 문의 : </h1>
        <p style="font-size: 3em;">전화번호 : 010-1234-1234</p>
        <p style="font-size: 3em;">LEAGUELUGAS</p>
    </div>
</main>
<%@include file="../footer.jsp"%>