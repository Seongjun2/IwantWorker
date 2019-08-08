<%@ page import="java.util.List" %>
<%@ page import="DAO.PayLogDAO" %>
<%@ page import="DAO.PayLogDAO_Impl" %>
<%@ page import="VO.PayLogVO" %>
<%@ page import="pagination.Paging" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="UTF-8"%>
<%@include file="../header.jsp"%>

<%
    Integer level = (Integer)session.getAttribute("user_level");
    Integer uuid = (Integer) session.getAttribute("uuid");

    if( level == null || uuid == null || level != 10){
        response.sendRedirect(router.main.index);
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
    List<PayLogVO> payLogList = new ArrayList<PayLogVO>();

    if ( status != null && (status.equals("Wait") || status.equals("Success") || status.equals("Expire"))) {
        payLogList = payLogDAO.findStatus(status);
    } else {
        payLogList = payLogDAO.findAll();
        status = "All";
    }

    Paging paging = new Paging(pageNum, payLogList.size());

%>
<main>
    <div class="div_pageName">
        <h3 class="h3_pageName">결제 대기 목록</h3>
    </div>
    <div class="div_mainDiv">
        <select id="paystate" class="select_paystate" onchange="filterState('<%=router.admin.wating_pay%>')">
            <option value="All">전체</option>
            <option value="Wait">입금확인중</option>
            <option value="Success">결제완료</option>
            <option value="Expire">결제취소</option>
        </select>
        <input type="hidden" id ="hidden_status" value = "<%= status %>"/>
        <table id = "userTable" class="table_list">
            <thead class="table_head">
                <tr>
                    <td id ="th_payNo">결제<br/>번호</td>
                    <td id = "th_name">이름</td>
                    <td id = "th_point">충전</br>포인트</td>
                    <td id = "th_price">가격</td>
                    <td id = "th_date">날짜</td>
                    <td id = "th_status">상태</td>
                </tr>
            </thead>
            <tbody class="table_body">
            <%
                int startIdx = paging.getStartIdx();
                int lastIdx = paging.getLastIdx();
                int num = ((pageNum-1)*10)+1;
                for(int i = startIdx-1; i< lastIdx; i++){
                    if(i > payLogList.size()-1 )break;
                    PayLogVO vo = payLogList.get(i);
                    int userUUID = vo.getUuid();
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
                <td><a href="./updatePoint.jsp?status=Success&uuid=<%=userUUID%>&chargePoint=<%=vo.getPoint()%>&pay_id=<%=vo.getPay_id()%>">승인</a><br/>
                    <a href="./updatePoint.jsp?status=Expire&uuid=<%=userUUID%>&chargePoint=<%=vo.getPoint()%>&pay_id=<%=vo.getPay_id()%>">거절</a></td>
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

    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/waitingPay.css">
    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/mypage.css">
    <script type="text/javascript" src="<%= jsDir %>/mypage.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
</html>