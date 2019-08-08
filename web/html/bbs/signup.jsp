<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "css";
    String jsDir = "js";
    String imgDir = "imgs";
%>
<%
    String ctxPath = request.getContextPath()+"/html";
    String success = null;
    String error = null;
    success = (String)session.getAttribute("success");
    error = (String)session.getAttribute("error");
    if ( session.getAttribute("uuid") != null ) {
        response.sendRedirect(ctxPath + "/index.jsp");
        return;
    }
    if ( error != null ) {
        if ( error.equals("id") ) {
            out.print("<script>alert('이미 등록된 전화번호 입니다.');</script>");
        }
    }
    else if ( success != null ){
        if ( success.equals("success") ){
            out.print("<script>alert('회원가입에 성공하였습니다.'); </script>");
        }
    }
    session.removeAttribute("error");
    session.removeAttribute("success");
%>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/signup.css">
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<script type="text/javascript" src="../js/signUp.js"></script>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">회원가입</h3>
    </div>
    <div class="div_mainDiv">
        <form action="signup2.jsp" method="POST">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                <input type="text" maxlength="11" pattern="\d*" class="input_userInfo" name="tell" id="tell" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="signup_enter()" placeholder="휴대폰 번호 입력"/>
                <p id = "explain_inputTell"> * (-) 하이폰 없이 숫자만 입력</p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">이름</p>
                <input type="id"  class="input_userInfo" name="name" id="name" onkeypress="signUp_enter()" placeholder="이름 입력"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">비밀번호</p>
                <input type="password"  class="input_userInfo" name="pw" id="pw" onkeypress="signUp_enter()" placeholder="비밀번호 입력"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">비밀번호 확인</p>
                <input type="password"  class="input_userInfo" name="pw_check" id="pw_check" onkeypress="signUp_enter()" placeholder="비밀번호 다시 입력"/>
            </div>

            <div class = "div_userInfo">
                <p class = "p_userInfo">본인확인 찾기 질문</p>
                <select name="question" style="border-radius:30px; height: 6%; font-size: 2em;">
                    <option>당신의 첫번째 자식 이름은?</option>
                    <option>당신의 반려자 의 이름은?</option>
                    <option>당신의 고향은?</option>
                    <option>당신의 어머님 성함은?</option>
                    <option>당신의 부모님 성함은?</option>
                    <option>당신의 주 언어는?</option>
                </select>
                <input type="text"  class="input_userInfo" name="answer" id="answer" onkeypress="signUp_enter()" placeholder="답변 입력"/>
            </div>

            <div id = "div_submit">
                <input id = "input_submit" type="submit" value="입력완료" onclick="check_PW(), signUp()"/>
            </div>

        </form>
    </div>
</main>
<%@include file="../footer.jsp"%>