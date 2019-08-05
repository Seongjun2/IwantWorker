<%@ page import="VO.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<%!
    String cssDir = "./../css";
    String jsDir = "./../js";
    String imgDir = "./../imgs";
%><%@include file="./../header.jsp"%><%
    BoardDAO_Impl dao = new BoardDAO_Impl();

    List<BoardVO> list = null;
    list = dao.findAll();
%>
<%--header�� head, footer�� body, html �±� �� ����. ���� �ȵ�--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">�Խ���</h3>
    </div>
    <div class="div_mainDiv" style="align-content: center">
        <button class="write_button" onclick="location.href='${pageContext.request.contextPath}/html/bbs/post_write.jsp'"> �۾��� </button>
<%--        <div class="board_post">--%>
<%--            <div class="board_title"> �غ����Դϴ�. </div>--%>
<%--            <div class="board_content">--%>
<%--                <ul>--%>
<%--                    <li> 19.07.15 ~ 19.08.09 </li>--%>
<%--                    <li> ��� : 10���� </li>--%>
<%--                    <li> ���ֽ�û </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
        <% if(list.isEmpty()) {
            System.out.println(new Date());%>
            <div class="board_post">
                <div class="board_title"> ���� �Խñ��� �����ϴ�. </div>
            </div>
        <% } else { %>
            <% for(BoardVO vo : list) { %>
                <div class="board_post">
                    <div class="board_title"><%=vo.getText()%></div>
                    <div class="board_content">
                        <ul>
                            <li><%=vo.getStartDate() + "~" + vo.getEndDate()%></li>
                            <li>��� : <%=vo.getMoney()%>
                            <li><%=vo.getAddress()%></li>
                        </ul>
                    </div>
                </div>
            <%}%>
        <%}%>
        <%@include file="./../pagination.jsp"%>
    </div>
</main>
<%@include file="./../footer.jsp"%>