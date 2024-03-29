<%@ page import="DAO.PointLogDAO" %>
<%@ page import="DAO.PointLogDAO_Impl" %>
<%@ page import="VO.PointLogVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pagination.Paging" %>
<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="../header.jsp"%>
<%
    Integer uuid = (Integer) session.getAttribute("uuid");
    List<PointLogVO> pointLogs = new ArrayList<PointLogVO>();

    if (uuid == null) {
%>
    <script>
        alert('먼저 로그인을 해주세요.');
        location.href = '<%= router.board.login %>'
    </script>
<%
    } else {
        PointLogDAO dao = new PointLogDAO_Impl();
        pointLogs = dao.findByUUID(uuid);
    }

    int pageNum = Util.parseIntOr( request.getParameter("pageNum"), 1 );
    Paging paging = new Paging(pageNum, pointLogs.size());
%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/mypage.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">포인트 변동기록</h3>
    </div>
    <div class="div_mainDiv">
        <% if (pointLogs.size() == 0) { %>
        <p class="empty_table">
            아직 포인트를 쌓거나 사용한 적이 없습니다. <br>
            <span class="text-emphasis">포인트를 결제</span>하고 다양한 기능을 사용해보세요!
        </p>
        <div class="redirect_wrapper">
            <a href="<%= router.board.shop %>">
                <button class="btn_redirect" type="button"> 포인트 결제하러 가기 </button>
            </a>
        </div>
        <% } else { %>
        <table class="table_list">
            <thead class="table_head">
            <tr>
                <td>사용<br/>번호</td>
                <td>내용</td>
                <td>변동</td>
                <td>잔여<br>포인트</td>
                <td>변동일자</td>
            </tr>
            </thead>
            <tbody class="table_body">
            <% for (int i = paging.getStartIdx()-1; i < paging.getLastIdx(); i++) { %>
            <% PointLogVO pointLog = pointLogs.get(i); %>
            <tr>
                <td><%= pointLog.getPointId() %></td>
                <td><%= pointLog.getInfo() %></td>
                <td><%= pointLog.getPoint() %></td>
                <td><%= pointLog.getPointTotal() %></td>
                <td class="td_date"><%= pointLog.getLogDate().substring(2, 10) %></td>
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