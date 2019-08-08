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

    if ( session.getAttribute("uuid") != null ) {
        response.sendRedirect(ctxPath + "/index.jsp");
        return;
    }
    if ( error != null ) {
        if ( error.equals("id") ) {
            out.print("<script>alert('전화번호가 일치하지 않습니다.'); </script>");
        } else if ( error.equals("pw")) {
            out.print("<script>alert('비밀번호가 일치하지 않습니다.'); </script>");
        } else if ( error.equals("account") ) {
            out.print("<script>alert('계정이 일치하지 않습니다.'); </script>");
        }
    }
    session.removeAttribute("error");
%>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/login.css">
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<script type="text/javascript" src="../js/login.js"></script>
<main>

    <div class="div_pageName">
        <h3 class = "h3_pageName">로그인</h3>
    </div>
    <div class="div_mainDiv">
        <form id="login_form" action="login2.jsp" method="POST">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                    <input type="text   " maxlength="11" pattern="\d*" class="input_userInfo" name="tell" id="tell" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  onkeypress="login_enter(event)" placeholder="휴대폰 번호 입력"/>
                <p id = "explain_inputTell"> * (-) 하이폰 없이 숫자만 입력</p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">비밀번호</p>
                <input type="password"  class="input_userInfo" name="pw" id="pw" onkeypress="login_enter(event)" placeholder="비밀번호 입력"/>
            </div>

            <div id = "div_submit">
                    <input id = "input_submit" type="button" onclick="login()" value="로그인"/>
            </div>

        </form>

        <div class="login_menu">
            <a href="<%=ctxPath + "/bbs/signup.jsp"%>">
                <p class = "p_loginExplain">앗! 아직 계정이 없나요? 회원가입을 해보세요!</p>
            </a>
        </div>
        <div class="login_menu">
            <button type="button" onclick="location.href='<%=ctxPath + "/bbs/signup.jsp"%>'">회원가입</button>
        </div>
        <div class="login_menu">
            <a href="<%=ctxPath + "/bbs/findaccount.jsp"%>">
                <p class = "p_loginExplain">계정을 잊어버리셨나요? 계정찾기 버튼을 눌러주세요!</p>
            </a>
        </div>
        <div class="login_menu">
            <button type="button" onclick="location.href='<%=ctxPath + "/bbs/findaccount.jsp"%>'">계정찾기</button>
        </div>
    </div>

</main>
<%@include file="../footer.jsp"%>