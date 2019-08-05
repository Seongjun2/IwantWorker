<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "css";
    String jsDir = "js";
    String imgDir = "imgs";
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
            <input type="id" name="id" placeholder="핸드폰 번호">
            <input type="password" name="pwd" placeholder="비밀번호">
            <input type="submit">
            <button type="button" onclick="location.href='http:\/\/www.naver.com'">회원가입</button>
            <button type="button" onclick="location.href='http:\/\/www.naver.com'">계정찾기</button>
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