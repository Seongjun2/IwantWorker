<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "css";
    String jsDir = "js";
    String imgDir = "imgs";
%>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%=cssDir%>/signup.css">
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/userInfo_modify.css">
<script type="text/javascript" src="js/modifyInfo_admin.js"></script>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">회원가입</h3>
    </div>
    <div class="div_mainDiv">
        <form action="./signup2.jsp" method="POST">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                <input type="text" class="input_userInfo" name="tell" id="tell" placeholder="휴대폰 번호 입력"/>
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

            <div id = "div_submit">
                <input id = "input_submit" type="submit" value="입력완료" onclick="check_PW()"/>
            </div>

        </form>
    </div>
</main>
<%@include file="../footer.jsp"%>