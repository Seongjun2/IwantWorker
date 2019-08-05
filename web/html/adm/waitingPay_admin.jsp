<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.PayLogDAO" %>
<%@ page import="DAO.PayLogDAO_Impl" %>
<%@ page import="VO.PayLogVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="l"%>
<%!
    String cssDir = "../css";
    String jsDir = "../js";
    String imgDir = "../imgs";
%>
<html>
<body>
<%@include file="../header.jsp"%>
<main>
    <div class="div_pageName">
        <h3 class="h3_pageName">결제 대기 목록</h3>
    </div>
    <div class="div_mainDiv">

        <table id = "userTable">
            <thead align="center">
            <tr>
                <th id ="th_payNo">결제번호</th>
                <th>이름</th>
                <th>충전</br>포인트</th>
                <th>가격</th>
                <th>날짜</th>
                <th>상태</th>
            </tr>
            </thead>
            <tbody align="center">
            <%
                PayLogDAO payLogDAO = new PayLogDAO_Impl();
                List<PayLogVO> payLogList = payLogDAO.findAll();
                for(PayLogVO vo : payLogList){
                    int uuid = vo.getUuid();
                    UserDAO userDAO = new UserDAO_Impl();
                    UserVO userVO = userDAO.getUserInfo(uuid);
                    String userName = userVO.getName();
                    String status = vo.getStatus();
                    String day = (vo.getRequestTime()).substring(0,10);
            %>
            <tr>
                <td><%=vo.getPay_id()%></td>
                <td><%=userName%></td>
                <td><%=vo.getPoint()%></td>
                <td><%=vo.getPrice()%></td>
                <td><%=day%></td>
                <%if(status.equals("Success")){%>
                <td>승인</td>
                <%}else if(status.equals("Expire")){%>
                <td>거절</td>
                <%}else if(status.equals("Wait")){%>
                <td><a href="./updatePoint.jsp?status=Success">승인</a> <a href="./updatePoint.jsp?status=Expire">거절</a></td>
                <%}%>
            </tr>
            <%
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