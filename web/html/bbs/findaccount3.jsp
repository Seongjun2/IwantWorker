<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="Util.Util" %>
<%!
    String cssDir = "css";
    String jsDir = "js";
    String imgDir = "imgs";
%>
<%
    String answer = request.getParameter("answer");
    String ctxPath = request.getContextPath();
    String tell = null;
    tell = (String)session.getAttribute("tell");

    if ( session.getAttribute("uuid") != null ) {
        response.sendRedirect(ctxPath + "/html/index.jsp");
        session.removeAttribute("tell");
        return;
    }
    if ( ctxPath == null || tell == null || answer == null ) {
        response.sendRedirect(ctxPath + "/html/bbs/findaccount.jsp");
        session.removeAttribute("tell");
        return;
    }
    UserDAO dao = new UserDAO_Impl();
    UserVO vo = null;
    String pw = null;
    try{
        pw = Util.pw();
        vo = dao.getUserInfo2(tell);
        dao.update( vo.getTell(), Util.md5( pw ), vo.getUuid() );
    } catch (Exception e){
    }
    session.removeAttribute("tell");
%>

<%@include file="../header.jsp"%>
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<link rel="stylesheet" type="text/css" , href="<%=cssDir%>/findaccount.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">계정찾기</h3>
    </div>
    <div class="div_mainDiv">
        <%
            if ( vo.getAnswer().equals(answer) ) {
                out.print("<script>alert('답변이 일치합니다.');</script>");
                %>
                <h1 style="font-size: 3.5em;"><%=vo.getName()%>님의 비밀번호 : </h1>
                <h1 style="font-size: 3.5em"><%=pw%> 입니다.</h1>
                <p style="font-size: 3.5em;">홈으로 돌아가면 비밀번호를 다시 확인할수 없습니다. 신중히 클릭하시길!</p>
        <input type="submit" style="
    font-size: 3em;
    text-align: center;
    width: 100%;
    height: 10%;
    margin-bottom: 1em;
    background: #ec8032;
    color: #ffffff;
    border-radius: 30px;" value="홈으로돌아가기" onclick="location.href='<%=ctxPath%>/html/index.jsp'" >
                <%
                return;
            } else if ( !vo.getAnswer().equals(answer)){
                out.print("<script>alert('답변이 일치하지 않습니다.');</script>");
                out.print("<script>location.href=\"" + ctxPath + "/html/bbs/findaccount2.jsp\";</script>");
            }
        %>
    </div>
</main>
<%@include file="../footer.jsp"%>