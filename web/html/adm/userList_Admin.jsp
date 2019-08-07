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
    String pageNumString = request.getParameter("pageNum");

    int pageNum = 0;
    if(pageNumString == null){
        pageNum = 1;
    }
    else{
        pageNum = Integer.parseInt(pageNumString);
    }

    Paging paging = new Paging();
    paging.makeBlock(pageNum);
    int blockStartNum = paging.getBlockStartNum();
    int blockLastNum = paging.getBlockLastNum();
    paging.makeLastPageNum();
    int lastPageNum = paging.getLastPageNum();
    System.out.println("blockStartNum : " + blockStartNum);
    System.out.println("blackLastNum : " + blockLastNum);
    System.out.println("lastPageNum : " + lastPageNum);
%>
<html>
<head>
    <title>userList</title>
</head>
<body>
<%@include file="../header.jsp"%>
<main>
    <div class="div_pageName">
        <h3 class="h3_pageName">ȸ����� ��ȸ</h3>
    </div>
    <div class="div_mainDiv">
        <table id = "userTable">
            <thead align="center">
                <tr>
                    <th>��ȣ</th>
                    <th>�̸�</th>
                    <th>����ó</th>
                    <th>����</th>
                </tr>
            </thead>
            <tbody align="center">
            <%
                UserDAO userDao = new UserDAO_Impl();
                List<UserVO> userList = userDao.findAll();
                int i = 1;
                for(int j = blockStartNum-1; j< blockLastNum;j++){
                    UserVO vo = userList.get(i);
                    if(vo.getPermission() == 2){
            %>
            <tr>
                <td> <%=i%></td>
                <td> <%=vo.getName()%></td>
                <td> <%=vo.getTell()%></td>
                <td>
                    <a href="./modify_userInfo_admin.jsp?uuid=<%=vo.getUuid()%>">�����ϱ�</a>
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
<%@include file="../paginationTest.jsp"%>
<%@include file="../footer.jsp"%>
</body>
    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/userList.css">
    <script type="text/javascript" src="../js/pagination_admin.js"></script>
</html>