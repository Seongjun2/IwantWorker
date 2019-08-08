<%@ page import="DAO.BoardDAO" %>
<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="VO.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<%@include file="../header.jsp"%>

<%
    // TODO: 페이징
    Integer uuid = (Integer) session.getAttribute("uuid");
    List<BoardVO> boards = null;

    if (uuid == null) {
        response.sendRedirect(router.main.index);
    } else {
        BoardDAO dao = new BoardDAO_Impl();
        boards = dao.findByUUID(uuid);
    }
%>

<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">내 게시글 목록</h3>
    </div>
    <div class="div_mainDiv">

        <div class="board_wrapper">
            <% for ( BoardVO board : boards ) { %>
            <div class="board_post">
                <div class="board_title"> <%= board.getText() %> </div>
                <div class="board_content">
                    <ul>
                        <li>
                            <%= board.getStartDate().substring(0, 10) %>
                            ~
                            <%= board.getEndDate().substring(0, 10) %>
                        </li>
                        <li> 일급 : <%= board.getMoney() %> 원 </li>
                        <li> <%= board.getAddress() %> </li>
                    </ul>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    <%@include file="../pagination.jsp"%>
</main>
<%@include file="../footer.jsp"%>