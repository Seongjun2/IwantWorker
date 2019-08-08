<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.PayLogDAO" %>
<%@ page import="DAO.PayLogDAO_Impl" %>
<%@ page import="VO.PayLogVO" %>
<%@ page import="pagination.Paging" %>
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
    paging.makeLastPageNum_userList();
    int lastPageNum = paging.getLastPageNum();

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
                <th id ="th_payNo">결제<br/>번호</th>
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

                int num = ((pageNum-1) * 10)+1;
                int lastIdx = 0;
                int startIdx = num-1;

                if(pageNum == lastPageNum) lastIdx = payLogList.size();
                else{
                    lastIdx = startIdx+10;
                }

                for(int i = startIdx; i< lastIdx; i++){
                    if(i > payLogList.size()-1 )break;
                    PayLogVO vo =payLogList.get(i);
                    int uuid = vo.getUuid();
                    UserDAO userDAO2 = new UserDAO_Impl();
                    UserVO userVO2 = userDAO2.getUserInfo(uuid);
                    String userName = userVO2.getName();
                    String status = vo.getStatus();
                    String day = (vo.getRequestTime()).substring(0,10);
            %>
            <tr>
                <td><%=num%></td>
                <td><%=userName%></td>
                <td><%=vo.getPoint()%></td>
                <td><%=vo.getPrice()%></td>
                <td><%=day%></td>
                <%if(status.equals("Success")){%>
                <td>승인</td>
                <%}else if(status.equals("Expire")){%>
                <td>거절</td>
                <%}else if(status.equals("Wait")){%>
                <td><a href="./updatePoint.jsp?status=Success&uuid=<%=uuid%>&chargePoint=<%=vo.getPoint()%>&pay_id=<%=vo.getPay_id()%>">승인</a><br/>
                    <a href="./updatePoint.jsp?status=Expire&uuid=<%=uuid%>&chargePoint=<%=vo.getPoint()%>&pay_id=<%=vo.getPay_id()%>">거절</a></td>
                <%}%>
            </tr>
            <%num++;}%>
            </tbody>
        </table>
    </div>
</main>
<%@include file="../pagination.jsp"%>
<%@include file="../footer.jsp"%>
</body>

    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/userList.css">
</html>