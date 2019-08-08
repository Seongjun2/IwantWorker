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
    if ( error != null ) {
        if ( error.equals("id") ) {
            out.print("<script>alert('이미 등록된 전화번호 입니다.');</script>");
        } else if ( error.equals("pw")) {
            out.print("<script>alert('비밀번호가 일치하지 않습니다.'); </script>");
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
<link rel="stylesheet" type="text/css", href="<%=cssDir%>/signup.css">
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/login.css">
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/findaccount.css">
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<script>
    window.onload = function (ev) {
        document.getElementById("input_submit").onclick = function () {
            var tell = document.getElementById("tell");
            var pw = document.getElementById("pw");
            var name = document.getElementById("name");
            var access_key = document.getElementById("access_key");

            if ( tell.value.indexOf(" ") != -1 || pw.value.indexOf(" ") != -1 || name.value.indexOf(" ") != -1 || access_key.value.indexOf(" ") != -1  ) {
                alert("공백은 입력할수 없습니다.");
                event.preventDefault();
                return;
            } else if ( isNaN(tell.value) ) {
                alert("전화번호에는 숫자만 입력이 가능합니다.");
                event.preventDefault();
                return;
            } else if ( tell.value == "" || name.value =="" || pw.value == ""  || access_key.value == ""){
                alert("빈칸은 입력할 수 없습니다.");
                event.preventDefault();
                return;
            } else if ( tell.value.length != 11 ) {
                alert("전화번호 11자리를 입력해주세요");
                event.preventDefault();
                return;
            }
            // } else if ( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(pw) ) {
            //     alert(pw.value);
            //     alert( pw.value.indexOf(/[A-Za-z0-9]/gi ) );
            //     alert("한글은 입력이 불가능합니다.");
            //     event.preventDefault()
            else {
                document.getElementById("login_form").submit();
            }
        };
    }
</script>
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
                <select name="question" style="border-radius:30px; height: 6%; font-size: 2em;">
                    <option>당신의 첫번째 자식 이름은?</option>
                    <option>당신의 반려자 의 이름은?</option>
                    <option>당신의 고향은?</option>
                    <option>당신의 주 언어는?</option>
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