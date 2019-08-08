<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="utf-8"%>
<%
    Integer level = (Integer)session.getAttribute("user_level");

    if( level == null || level != 10){
        response.sendRedirect(Router.getInstance(request.getContextPath()).main.index);
    }

    String userUUID = request.getParameter("uuid");
    if(userUUID == null) {
        response.sendRedirect("./userList_Admin.jsp");
        return;
    }

    UserDAO dao = new UserDAO_Impl();
    UserVO vo = dao.getUserInfo(Integer.parseInt(userUUID));
%>
<%@include file="../header.jsp"%>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">회원정보 수정</h3>
    </div>
    <div class="div_mainDiv">
        <form action="./userInfoUpdate.jsp" method="post" onsubmit="this.hand">
            <div class = "div_userInfo">
                <p class = "p_userInfo">휴대폰 번호</p>
                <input type="number" maxlength="11" id="input_tell" style="ime-mode:disabled;" onkeyup="SetNum(this)" onkeypress="NumObj(this)" class="input_userInfo" name="tell" value="<%=vo.getTell()%>"/>
                <p id = "explain_inputTell"> * 숫자만 입력</p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">이름</p>
                <p id ="p_name"><%=vo.getName()%></p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">변경할 비밀번호</p>
                <input id = "pw" type="password"  class="input_userInfo" name="pw"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">변경할 비밀번호 확인</p>
                <input id = "pw_check" type="password"  class="input_userInfo" name="pw_check"/>
            </div>

            <div class = "div_userInfo">
                <p class = "p_userInfo">본인확인 찾기 질문</p>
                <select name="questions" class="select_hint">
                    <option id ="1">당신의 첫번째 자식 이름은?</option>
                    <option id ="2">당신의 반려자 의 이름은?</option>
                    <option id ="3">당신의 고향은?</option>
                    <option id ="4">당신의 어머님 성함은?</option>
                    <option id ="5">당신의 아버님 성함은?</option>
                    <option id ="6">당신의 주 언어는?</option>
                </select>
                <input type="text"  class="input_userInfo" name="answer" id="access_key" value ="<%=vo.getAnswer()%>"/>
            </div>
            <input type="hidden" id ="hidden_question" value = "<%=vo.getQuestion()%>"/>
            <input type="hidden" value="<%=userUUID%>" name = "uuid">
            <div id = "div_submit">
                <input id = "input_submit" type="submit" value="변경하기" onclick="check_PW()"/>
            </div>
        </form>
    </div>
</main>
<%@include file="../footer.jsp"%>
</body>
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/userInfo_modify.css">
    <script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</html>