<%@ page import="DAO.BoardDAO" %>
<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="VO.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>

<%
    Integer uuid = (Integer) session.getAttribute("uuid");
    List<BoardVO> boards = new ArrayList<BoardVO>();

    if (uuid == null) {
        response.sendRedirect(router.main.index);
    } else {
        BoardDAO dao = new BoardDAO_Impl();
        boards = dao.findByUUID(uuid);
    }
%>

<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/mypage.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">내 게시글 목록</h3>
    </div>
    <div class="div_mainDiv">
        <% if (boards.size() == 0) { %>
        <p class="empty_table">
            아직 작성한 게시글이 없습니다. <br><br>
            <span class="text-emphasis">구인 게시글을 작성</span>하고 <br>
            간편하게 단기 알바를 구해보세요!
        </p>
        <div class="redirect_wrapper">
            <a href="<%= router.board.post_write %>">
                <button class="btn_redirect" type="button"> 게시글 작성하러 가기 </button>
            </a>
        </div>
        <% } else { %>
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
    <% } %>
</main>
<%@include file="../footer.jsp"%>