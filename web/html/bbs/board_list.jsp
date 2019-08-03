<%@ page contentType="text/html;charset=UTF-8" %>
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
    <div class="div_mainDiv">
        <div id="board_post">
            <div id="board_title"> 준비중입니다. </div>
            <div id="board_content">
                <ul>
                    <li> 귤 | 수확 </li>
                    <li> 19.07.15 ~ 19.08.09 </li>
                    <li> 비용 : 10만원 </li>
                    <li> 제주시청 </li>
                </ul>
            </div>
        </div>
    </div>
</main>
<%@include file="./../footer.jsp"%>