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
</head>

<body>
<%@include file="../header.jsp"%>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">로그인</h3>
    </div>
    <div class="div_mainDiv">
        <form action="login2.jsp" method="POST">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                    <input type="text" class="input_userInfo" name="tell" id="tell" placeholder="휴대폰 번호 입력"/>
                <p id = "explain_inputTell"> * (-) 하이폰 없이 숫자만 입력</p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">비밀번호</p>
                <input type="password"  class="input_userInfo" name="pw" id="pw" placeholder="비밀번호 입력"/>
            </div>

            <div id = "div_submit">
                <input id = "input_submit" type="submit" value="로그인"/>
            </div>

        </form>
    </div>
    <div class="div_login_menu">
        <div class="login_menu">
            <a href="<%=ctxPath + "/bbs/signup.jsp"%>">
                <p>- 앗! 아직 계정이 없나요? 회원가입을 해보세요!</p>
            </a>
            </div>
            <div class="login_menu">
                <button type="button" onclick="location.href='<%=ctxPath + "/bbs/signup.jsp"%>'">회원가입</button>
            </div>
            <div class="login_menu">
                <a href="<%=ctxPath + "/bbs/findaccount.jsp"%>">
                    <p>- 계정을 잊어버리셨나요? 계정찾기 버튼을 눌러주세요!</p>
                </a>
            </div>
            <div class="login_menu">
                <button type="button" onclick="location.href='<%=ctxPath + "/bbs/findaccount.jsp"%>'">계정찾기</button>
            </div>
    </div>
</main>
<%@include file="../footer.jsp"%>
<link rel="stylesheet" type="text/css" , href="<%=cssDir%>/login.css">
</body>

</html>