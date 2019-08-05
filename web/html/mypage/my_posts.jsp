<%@ page import="DAO.BoardDAO" %>
<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="VO.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<%@include file="../header.jsp"%>

<%
    Integer uuid = (Integer) session.getAttribute("uuid");

    if (uuid == null) {
        response.sendRedirect(router.main.index);
    } else {
        BoardDAO dao = new BoardDAO_Impl();
        List<BoardVO> boards = dao.findByUUID(uuid);

        for (BoardVO board : boards) {
            System.out.println( board.toString() );
        }
    }
%>

<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">�� �Խñ� ���</h3>
    </div>
    <div class="div_mainDiv">
        <div class="board_wrapper">
            <div class="board_post">
                <div class="board_title"> �غ����Դϴ�. </div>
                <div class="board_content">
                    <ul>
                        <li> �� | ��Ȯ </li>
                        <li> 19.07.15 ~ 19.08.09 </li>
                        <li> ��� : 10���� </li>
                        <li> ���ֽ�û </li>
                    </ul>
                </div>
            </div>
            <div class="board_post">
                <div class="board_title"> �� �ɾ� �� �ɾ�  </div>
                <div class="board_content">
                    <ul>
                        <li> �� | ��Ȯ </li>
                        <li> 19.07.15 ~ 19.08.09 </li>
                        <li> ��� : 10���� </li>
                        <li> ���ֽ�û </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../pagination.jsp"%>
</main>
<%@include file="../footer.jsp"%>