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
<html>
<head>
    <title>userList</title>
</head>
<body>
<%@include file="../header.jsp"%>
<main>
    <div class="div_pageName">
        <h3 class="h3_pageName">회원목록 조회</h3>
    </div>
    <div class="div_mainDiv">
        <table id = "userTable">
            <thead align="center">
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>연락처</th>
                    <th>수정</th>
                </tr>
            </thead>
            <tbody align="center">
            <%
                UserDAO userDao = new UserDAO_Impl();
                List<UserVO> userList = userDao.findAll();
                int i = 1;
                for(UserVO vo : userList){
                    if(vo.getPermission() == 2){
            %>
            <tr>
                <td> <%=i%></td>
                <td> <%=vo.getName()%></td>
                <td> <%=vo.getTell()%></td>
<%--                <td><input type="button" value = "수정" class="btn_modify"/></td>--%>
                <td>
                    <form action="./modify_userInfo_admin.jsp?uuid=<%=vo.getUuid()%>" method="post">
                        <input type="submit" value = "수정" class="btn_modify">
                    </form>
                </td>
            </tr>
            <%
                    i++;}
                }
            %>
            </tbody>
        </table>
    </div>
</main>
<%@include file="../footer.jsp"%>
</body>
    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/userList.css">
</html>