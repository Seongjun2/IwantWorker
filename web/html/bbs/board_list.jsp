<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<%!
    String cssDir = "./../css";
    String jsDir = "./../js";
    String imgDir = "./../imgs";
%><%@include file="./../header.jsp"%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">게시판</h3>
    </div>
    <div class="div_mainDiv" style="align-content: center">
        <button class="write_button" onclick="location.href='${pageContext.request.contextPath}/html/bbs/post_write.jsp'"> 글쓰기 </button>
        <div class="board_post">
            <div class="board_title"> 준비중입니다. </div>
            <div class="board_content">
                <ul>
                    <li> 귤 | 수확 </li>
                    <li> 19.07.15 ~ 19.08.09 </li>
                    <li> 비용 : 10만원 </li>
                    <li> 제주시청 </li>
                </ul>
            </div>
        </div>
        <div class="order_button">
            <button> < </button>
            <% for(int i=1;i<=3;i++){%>
            <button><%=i%></button>
            <%}%>
            <button> > </button>
        </div>
    </div>
</main>
<%@include file="./../footer.jsp"%>