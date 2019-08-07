<%@ page import="DAO.BoardDAO" %>
<%@ page import="VO.BoardVO" %>
<%@ page import="DAO.BoardDAO_Impl" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-04
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Integer bo_id = Integer.parseInt(request.getParameter("bo_id"));

    BoardDAO dao = new BoardDAO_Impl();

    BoardVO vo = dao.findByBoID(bo_id);
%>
<%@include file="./../header.jsp"%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/post_view.css">
<script type="text/javascript" src="<%=jsDir%>/post.js"></script>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">구 인</h3>
    </div>
    <div class="div_mainDiv">
        <div class="title">여기는 제목입니다</div>
        <hr>
        <div class="main_content">
            <div style="width: 100%; height: 100%;">
                <div class="circle" style="margin-left: 50px"><p>일당</p></div>
                <div class="circle"><p>시간</p></div>
                <div class="circle"><p>위치</p></div>
            </div>
            <div style="width: 100%;">
                <div class="circle_content"><%=vo.getMoney()%>원</div>
                <div class="circle_content"><%=vo.getWorkTime()%></div>
                <div class="circle_content"><%=vo.getAddress()%></div>
            </div>
        </div>
        <hr color="black" style="width: 100%">
        <div class="etc">
            <ul>
                <li>모집기간 | <%=vo.getStartDate().substring(0, 10) + "~" + vo.getEndDate().substring(0, 10)%></li>
            </ul>
        </div>
        <div class="memo">
            <%=vo.getContent()%>
        </div>
        <div style="width: 100%">
            <% System.out.println("this is vo id : " + vo.getUuid().toString()); %>
            <% if ((session.getAttribute("uuid").toString()).equals(vo.getUuid().toString())) {%>
                <% System.out.println("true!"); %>
                <button class="button_writer">수정하기</button>
                <button class="button_writer">삭제하기</button>
            <% } else { %>
                <button class="button_guest" onclick="history.back()">홈으로</button>
            <% } %>
        </div>
    </div>
</main>
<%@include file="./../footer.jsp"%>
