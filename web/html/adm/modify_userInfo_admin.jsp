<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<%!
    String cssDir = "../css";
    String jsDir = "../js";
    String imgDir = "../imgs";
%>
<%
    Integer level = (Integer)session.getAttribute("user_level");

    if( level == null || level != 10){
        response.sendRedirect(Router.getInstance(request.getContextPath()).main.index);
    }

    String uuid = null;
    uuid = request.getParameter("uuid");
    if(uuid == null) {
        response.sendRedirect("./userList_Admin.jsp");
        return;
    }

    UserDAO dao = new UserDAO_Impl();
    UserVO vo = dao.getUserInfo(Integer.parseInt(uuid));
//    session.setAttribute("uuid", vo.getUuid());
%>
<html>
<head>
    <title>ModifyInfo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/main.css">
    <link rel="stylesheet" type="text/css", href="<%= cssDir %>/common.css">
    <script type="text/javascript" src="<%= jsDir %>/common.js"></script>


    <script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
<%@include file="../header.jsp"%>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">ȸ������ ����</h3>
    </div>
    <div class="div_mainDiv">
        <form action="./userInfoUpdate.jsp" method="post" onsubmit="this.hand">
            <div class = "div_userInfo">
                <p class = "p_userInfo">�޴��� ��ȣ</p>
                <input type="number" maxlength="11" id="input_tell" style="ime-mode:disabled;" onkeyup="SetNum(this)" onkeypress="NumObj(this)" class="input_userInfo" name="tell" value="<%=vo.getTell()%>"/>
                <p id = "explain_inputTell"> * ���ڸ� �Է�</p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">�̸�</p>
                <p id ="p_name"><%=vo.getName()%></p>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">������ ��й�ȣ</p>
                <input id = "pw" type="password"  class="input_userInfo" name="pw"/>
            </div>
            <div class = "div_userInfo">
                <p class = "p_userInfo">������ ��й�ȣ Ȯ��</p>
                <input id = "pw_check" type="password"  class="input_userInfo" name="pw_check"/>
            </div>
            <input type="hidden" value="<%=uuid%>" name = "uuid">
            <div id = "div_submit">
                <input id = "btn_modify" type="submit" value="�����ϱ�" onclick="check_PW()"/>
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