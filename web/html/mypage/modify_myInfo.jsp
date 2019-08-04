<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>>/userInfo_modify.css">

<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">내 정보 수정</h3>
    </div>
    <div class="div_mainDiv">
        <form action="./userInfoUpdate.jsp" method="get">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                <input type="text" class="input_userInfo" name="tell" value="010-1111-1111"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">이름</p>
                <p id ="p_name">김농부</p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">변경할 비밀번호</p>
                <input type="password"  class="input_userInfo" name="pw"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">변경할 비밀번호 확인</p>
                <input type="password"  class="input_userInfo" name="pw_check"/>
            </div>

            <div id = "div_submit">
                <input id = "input_submit" type="submit" value="변경하기"/>
            </div>

        </form>
    </div>
</main>

<%@include file="../footer.jsp"%>