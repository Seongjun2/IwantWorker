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
    Integer level = (Integer)session.getAttribute("user_level");

    if( level == null || level != 10){
        response.sendRedirect(Router.getInstance(request.getContextPath()).main.index);
    }

    String pageNumString = request.getParameter("pageNum");

    int pageNum = 0;
    if(pageNumString == null){
        pageNum = 1;
    }
    else{
        pageNum = Integer.parseInt(pageNumString);
    }
    String status = request.getParameter("status");

    PayLogDAO payLogDAO = new PayLogDAO_Impl();
    List<PayLogVO> payLogList = null;
    if(status == null || status.equals("전체")){
         payLogList = payLogDAO.findAll();
    }
    else{
        payLogList = payLogDAO.findStatus(status);
    }
    Paging paging = new Paging(pageNum, payLogList.size());

%>
<html>
<body>
<%@include file="../header.jsp"%>
<main>
    <div class="div_pageName">
        <h3 class="h3_pageName">결제 대기 목록</h3>
    </div>
    <div class="div_mainDiv">

        <select id="paystate" class="select_paystate" onchange="filterState('<%=router.admin.wating_pay%>')">
            <option>전체</option>
            <option value="Wait">입금확인중</option>
            <option value="Success">결제완료</option>
            <option value="Expire">결제취소</option>
        </select>
        <table id = "userTable">
            <thead align="center">
            <tr>
                <th id ="th_payNo">결제<br/>번호</th>
                <th id = "th_name">이름</th>
                <th id = "th_point">충전</br>포인트</th>
                <th id = "th_price">가격</th>
                <th id = "th_date">날짜</th>
                <th id = "th_status">상태</th>
            </tr>
            </thead>
            <tbody align="center">
            <%
                int startIdx = paging.getStartIdx();
                int lastIdx = paging.getLastIdx();
                int num = ((pageNum-1)*10)+1;
                for(int i = startIdx-1; i< lastIdx; i++){
                    if(i > payLogList.size()-1 )break;
                    PayLogVO vo = payLogList.get(i);
                    int uuid = vo.getUuid();
                    String vo_status = vo.getStatus();
                    String day = (vo.getRequestTime()).substring(0,10);
            %>
            <tr>
                <td><%=num%></td>
                <td id = "td_name"><%=vo.getName()%></td>
                <td><%=vo.getPoint()%></td>
                <td><%=vo.getPrice()%></td>
                <td id = "td_date"><%=day%></td>
                <%if(vo_status.equals("Success")){%>
                <td class = "td_statusSuccess">승인</td>
                <%}else if(vo_status.equals("Expire")){%>
                <td class = "td_statusExpire">거절</td>
                <%}else if(vo_status.equals("Wait")){%>
                <td><a href="./updatePoint.jsp?status=Success&uuid=<%=uuid%>&chargePoint=<%=vo.getPoint()%>&pay_id=<%=vo.getPay_id()%>">승인</a><br/>
                    <a href="./updatePoint.jsp?status=Expire&uuid=<%=uuid%>&chargePoint=<%=vo.getPoint()%>&pay_id=<%=vo.getPay_id()%>">거절</a></td>
                <%}%>
            </tr>
            <%num++;}%>
            </tbody>
        </table>
    </div>
</main>
<jsp:include page="../pagination.jsp">
    <jsp:param name="pageNum" value="<%= pageNum %>"/>
    <jsp:param name="lastPageNum" value="<%= paging.getLastPageNum() %>"/>
</jsp:include>
<%@include file="../footer.jsp"%>
</body>

    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/userList.css">
    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/waitingPay.css">
    <script type="text/javascript" src="<%= jsDir %>/mypage.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
</html>