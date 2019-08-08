<%@ page import="DAO.PayLogDAO" %>
<%@ page import="DAO.PayLogDAO_Impl" %>
<%@ page import="VO.PayLogVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pagination.Paging" %>
<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp"%>
<%
    Integer uuid = (Integer) session.getAttribute("uuid");
    String status = request.getParameter("status");

    PayLogDAO dao = new PayLogDAO_Impl();
    List<PayLogVO> payLogs = new ArrayList<PayLogVO>();

    if ( uuid == null ) {
        response.sendRedirect(router.main.index);
    } else {
        if ( status == null ) {
            payLogs = dao.findByUUID(uuid);
        } else {
            payLogs = dao.findByUUIDAndStatus(uuid, status);
        }
    }

    int pageNum = Util.parseIntOr( request.getParameter("pageNum"), 1 );
    Paging paging = new Paging(pageNum, payLogs.size());

%>
<script type="text/javascript" src="<%= jsDir %>/mypage.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/mypage.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">내 결제 목록</h3>
    </div>
    <div class="div_mainDiv">
        <% if (payLogs.size() == 0) { %>
        <p class="empty_table">
            아직 결제를 한 적이 없습니다. <br>
            <span class="text-emphasis">포인트를 결제</span>하고 다양한 기능을 사용해보세요!
        </p>
        <div class="redirect_wrapper">
            <a href="<%= router.board.shop %>">
                <button class="btn_redirect" type="button"> 포인트 결제하러 가기 </button>
            </a>
        </div>
        <% } else { %>
        <select id="paystate" class="select_paystate" onchange="filterState('<%=router.mypage.pay_list%>')">
            <option>전체</option>
            <option value="Wait">입금확인중</option>
            <option value="Success">결제완료</option>
            <option value="Expire">결제취소</option>
        </select>
        <table class="table_list">
            <thead class="table_head">
                <tr>
                    <td>결제<br/>번호</td>
                    <td>충전<br/>포인트</td>
                    <td>가격</td>
                    <td>결제일자</td>
                    <td>상태</td>
                </tr>
            </thead>
            <tbody class="table_body">
            <% for (int i = paging.getStartIdx()-1; i < paging.getLastIdx(); i++) { %>
                <% PayLogVO payLog = payLogs.get(i); %>
                <tr>
                    <td><%= payLog.getPay_id() %></td>
                    <td><%= payLog.getPoint() %></td>
                    <td><%= payLog.getPrice() %>원</td>
                    <td class="td_date"><%= payLog.getRequestTime().substring(2, 11) %></td>
                    <td>
                        <% if ( payLog.getStatus().equals("Wait") ) { %>
                        입금확인중
                        <% } else if ( payLog.getStatus().equals("Success") ) { %>
                        결제완료
                        <% } else if ( payLog.getStatus().equals("Expire") ) { %>
                        결제취소
                        <% } %>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <jsp:include page="../pagination.jsp">
        <jsp:param name="pageNum" value="<%= pageNum %>"/>
        <jsp:param name="lastPageNum" value="<%= paging.getLastPageNum() %>"/>
    </jsp:include>
    <% } %>
</main>

<%@include file="../footer.jsp"%>