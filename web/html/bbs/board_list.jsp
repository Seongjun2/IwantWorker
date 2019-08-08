<%@ page import="VO.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="../header.jsp"%>
<%
    BoardDAO_Impl dao = new BoardDAO_Impl();

    List<BoardVO> list = null;
    list = dao.findAll();
%>
<%--<% System.out.println(router.board.post_get); %>--%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<script type="text/javascript" src="<%=jsDir%>/board.js"></script>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">게시판</h3>
    </div>
    <div class="div_mainDiv" style="align-content: center">
        <% if(session.getAttribute("uuid")!=null) {%>
            <button class="write_button" onclick="location.href='${pageContext.request.contextPath}/html/bbs/post_write.jsp'"> 글쓰기 </button>
        <% } %>
        <% if(list.isEmpty()) {%>
            <div class="board_post">
                <div class="board_title"> 아직 게시글이 없습니다. </div>
            </div>
        <% } else { %>
            <% for(BoardVO vo : list) { %>
                <% String money = String.format("%.1f", vo.getMoney()/10000.0); %>
                <div class="board_post" onclick="location.href='<%=router.board.post_view%>?bo_id=<%=vo.getBoard_id()%>'">
                    <div class="board_title"><%=vo.getText()%></div>
                    <div class="board_content">
                        <ul>
                            <li>기간 : <%=vo.getStartDate().substring(0, 10) + "~" + vo.getEndDate().substring(0, 10)%></li>
                            <li>비용 : <%=money%> 만 원
                            <li><%=vo.getAddress()%></li>
                        </ul>
                    </div>
                </div>
            <%}%>
        <%}%>
<%--        <%@include file="./../pagination.jsp"%>--%>
    </div>
</main>
<%@include file="./../footer.jsp"%>