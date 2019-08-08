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
        } else if (error.equals("pw")) {
            out.print("<script>alert('비밀번호가 일치하지 않습니다.'); </script>");
        }
    }
    session.removeAttribute("error");
%>
<%@include file="../header.jsp"%>
<main>
    <script>
            function login() {
            var tell = document.getElementById("tell");
            var pw = document.getElementById("pw");
            if ( tell.value == "admin" && pw.value == "admin" ) {
                alert('로그인에 성공하였습니다.');
                document.getElementById("login_form").submit();
                return;
            }

            if ( tell.value.indexOf(" ") != -1 || pw.value.indexOf(" ") != -1 ) {
                alert("공백은 입력할수 없습니다.");
                event.preventDefault();
                return;
            } else if ( isNaN(tell.value) ) {
                alert("전화번호에는 숫자만 입력이 가능합니다.");
                event.preventDefault();
                return;
            } else if ( tell.value == "" || pw.value == ""){
                alert("빈칸은 입력할 수 없습니다.");
                event.preventDefault();
                return;
            } else if ( tell.value.length != 11 ) {
                alert("전화번호 11자리를 입력해주세요");
                event.preventDefault();
                return;
            }
            else {
                document.getElementById("login_form").submit();
            }
        };
        login_enter = function (event) {
            if ( event.code === 'Enter' || event.code === 'NumpadEnter' ) {
                login();
            }
        };

    </script>

    <div class="div_pageName">
        <h3 class = "h3_pageName">로그인</h3>
    </div>
    <div class="div_mainDiv">
        <form id="login_form" action="login2.jsp" method="POST">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                    <input type="text" class="input_userInfo" name="tell" id="tell" onkeypress="login_enter(event)" placeholder="휴대폰 번호 입력"/>
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