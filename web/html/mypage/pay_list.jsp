<%@ page import="DAO.PayLogDAO" %>
<%@ page import="DAO.PayLogDAO_Impl" %>
<%@ page import="VO.PayLogVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp"%>
<%
    Integer uuid = (Integer) session.getAttribute("uuid");
    List<PayLogVO> payLogs = new ArrayList<PayLogVO>();

    if ( uuid == null ) {
        response.sendRedirect(router.main.index);
    } else {
        PayLogDAO dao = new PayLogDAO_Impl();
        payLogs = dao.findByUUID(uuid);
    }
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
            <% for (PayLogVO payLog: payLogs) { %>
                <tr>
                    <td><%= payLog.getPay_id() %></td>
                    <td><%= payLog.getPoint() %></td>
                    <td><%= payLog.getPrice() %></td>
                    <td class="td_date"><%= payLog.getRequestTime().substring(2, 11) %></td>
                    <td>
                        <%= payLog.getStatus() %>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <%@include file="../pagination.jsp"%>
</main>

<%@include file="../footer.jsp"%>