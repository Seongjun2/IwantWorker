<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "css";
    String jsDir = "js";
    String imgDir = "imgs";
%>
<%
    String ctxPath = request.getContextPath()+"/html";
    String error = null;
    error = (String)session.getAttribute("error");
    if ( error != null ) {
        if ( error.equals("id") ) {
            out.print("<script>alert('전화번호가 일치하지 않습니다.'); </script>");
        } else if ( session.getAttribute("error").equals("pw")) {
            out.print("<script>alert('비밀번호가 일치하지 않습니다.'); </script>");
        }
    }
    else {

    }
    session.removeAttribute("error");
%>
<script type="text/javascript" src="<%= jsDir %>/main.js"></script>
<html>

<head>
    <title>Jeju</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" , href="<%=cssDir%>/common.css">
</head>

<body>
<%@include file="../header.jsp"%>
<main>
    <div class="h3_pageName">
        <h3>로그인</h3>
    </div>
    <div class="div_mainDiv">
        <form method="POST" action="login2.jsp">
            <input type="id" name="tell" placeholder="핸드폰 번호">
            <input type="password" name="pw" placeholder="비밀번호">
            <input type="submit">

            <button type="button" onclick="location.href='<%=ctxPath + "/bbs/signup.jsp"%>'">회원가입</button>
            <button type="button" onclick="location.href='<%=ctxPath + "/bbs/findaccount.jsp"%>'">계정찾기</button>
            <a href="#">
                <h4>- 앗! 아직 계정이 없나요? 회원가입을 해보세요!</h4>
            </a>
            <a href="#">
                <h4>- 계정을 잊어버리셨나요? 계정찾기 버튼을 눌러주세요!</h4>
            </a>
        </form>
    </div>
</main>

<%@include file="../footer.jsp"%>
</body>

</html>