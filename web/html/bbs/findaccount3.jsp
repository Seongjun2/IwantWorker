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
    String ctxPath = request.getContextPath() + "/html";
    String tell = null;
    tell = (String)session.getAttribute("tell");

    if ( session.getAttribute("uuid") != null ) {
        response.sendRedirect(ctxPath + "/html/index.jsp");
        session.removeAttribute("tell");
        return;
    }
    if ( ctxPath == null || tell == null || answer == null ) {
        response.sendRedirect(ctxPath + "/bbs/findaccount.jsp");
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
                <h1><%=vo.getName()%>님의 비밀번호는</h1>
                <h1><%=pw%> 입니다.</h1>
                <p>홈으로 돌아가면 비밀번호를 다시 확인할수 없습니다. 신중히 클릭하시길!</p>
        <input type="submit" id="input_submit" value="홈으로돌아가기" onclick="location.href='<%=ctxPath%>/index.jsp'" >
                <%
                return;
            } else if ( !vo.getAnswer().equals(answer)){
                out.print("<script>alert('답변이 일치하지 않습니다.');</script>");
                out.print("<script>location.href=\"" + ctxPath + "/html/bbs/findaccount2.jsp\";</script>");
                return;
            }
        %>
    </div>
</main>
<%@include file="../footer.jsp"%>