<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">내 게시글 목록</h3>
    </div>
    <div class="div_mainDiv">
        <div class="board_wrapper">
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
            <div class="board_post">
                <div class="board_title"> 귤 쪼아 귤 쪼아  </div>
                <div class="board_content">
                    <ul>
                        <li> 귤 | 수확 </li>
                        <li> 19.07.15 ~ 19.08.09 </li>
                        <li> 비용 : 10만원 </li>
                        <li> 제주시청 </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../pagination.jsp"%>
</main>
<%@include file="../footer.jsp"%>