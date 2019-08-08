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
    PayLogDAO dao = new PayLogDAO_Impl();
    List<PayLogVO> payLogs = new ArrayList<PayLogVO>();

    if ( uuid == null ) {
        response.sendRedirect(router.main.index);
    } else {
        payLogs = dao.findByUUID(uuid);
    }

    int pageNum = Util.parseIntOr( request.getParameter("pageNum"), 1 );
    Paging paging = new Paging(pageNum, payLogs.size());

%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/mypage.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">내 결제 목록</h3>
    </div>
    <div class="div_mainDiv">
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
</main>

<%@include file="../footer.jsp"%>