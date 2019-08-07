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
            out.print("<script>alert('이미 등록된 전화번호 입니다.');</script>");
        } else if ( session.getAttribute("error").equals("pw")) {
            out.print("<script>alert('비밀번호가 일치하지 않습니다.'); </script>");
        }
    }
    else {

    }
    session.removeAttribute("error");
%>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%=cssDir%>/signup.css">
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/login.css">
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/findaccount.css">
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">회원가입</h3>
    </div>
    <div class="div_mainDiv">
        <form action="signup2.jsp" method="POST">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                <input type="text" class="input_userInfo" name="tell" id="tell" placeholder="휴대폰 번호 입력"/>
                <p id = "explain_inputTell"> * (-) 하이폰 없이 숫자만 입력</p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">이름</p>
                <input type="id"  class="input_userInfo" name="name" id="name" placeholder="이름 입력"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">비밀번호</p>
                <input type="password"  class="input_userInfo" name="pw" id="pw" placeholder="비밀번호 입력"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">비밀번호 확인</p>
                <input type="password"  class="input_userInfo" name="pw_check" id="pw_check" placeholder="비밀번호 다시 입력"/>
            </div>

            <div class = "div_userInfo">
                <p class = "p_userInfo">본인확인 찾기 질문</p>
                <select name="question">
                    <option>fisst?</option>
                    <option>second?</option>
                </select>
                <input type="text"  class="input_userInfo" name="answer" id="access_key" placeholder="답변 입력"/>
            </div>

            <div id = "div_submit">
                <input id = "input_submit" type="submit" value="입력완료" onclick="check_PW()"/>
            </div>

        </form>
    </div>
</main>
<%@include file="../footer.jsp"%>