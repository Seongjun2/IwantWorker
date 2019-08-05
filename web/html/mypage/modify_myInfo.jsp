<%@ page import="VO.UserVO" %>
<%@ page import="DAO.UserDAO, DAO.UserDAO_Impl" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp"%>
<%
    Integer uuid = null;
    uuid = (Integer) session.getAttribute("uuid");
    if(uuid == null) {
        response.sendRedirect(router.main.index);
        return;
    }

    UserDAO dao = new UserDAO_Impl();
    UserVO vo = dao.getUserInfo(uuid);
%>

<link rel="stylesheet" type="text/css", href="<%= cssDir %>/userInfo_modify.css">
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">내 정보 수정</h3>
    </div>
    <div class="div_mainDiv">
        <form method="POST" action="<%= router.mypage.my_posts %>">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                <input type="number" maxlength="11" id="input_tell" style="ime-mode:disabled;"
                       onkeyup="SetNum(this)" onkeypress="NumObj(this)"
                       class="input_userInfo" name="tell" value="<%=vo.getTell()%>"/>
                <p id = "explain_inputTell"> * 숫자만 입력</p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">이름</p>
                <p id ="p_name"><%= vo.getName() %></p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">변경할 비밀번호</p>
                <input id = "pw" type="password"  class="input_userInfo" name="pw"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">변경할 비밀번호 확인</p>
                <input id = "pw_check" type="password"  class="input_userInfo" name="pw_check"/>
            </div>

            <div id = "div_submit">
                <input id = "input_submit" type="submit" value="변경하기" onclick="check_PW()"/>
            </div>

        </form>
    </div>
</main>

<%@include file="../footer.jsp"%>