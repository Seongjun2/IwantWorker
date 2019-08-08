<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "css";
    String jsDir = "js";
    String imgDir = "imgs";
%>
<%@include file="../header.jsp"%>
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<link rel="stylesheet" type="text/css" , href="<%=cssDir%>/findaccount.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">계정찾기</h3>
    </div>
    <div class="div_mainDiv">
        <h1>본인의 전화번호를 입력해주세요</h1>
        <form method="post" action="findaccount2.jsp">
            <input type="text" name="tell"/>
            <input type="submit">
        </form>

    </div>
</main>
<%@include file="../footer.jsp"%>