<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "css";
    String jsDir = "js";
    String imgDir = "imgs";
%>
<%
    String ctxPath = request.getContextPath()+"/html";

    if ( session.getAttribute("uuid") != null ) {
        response.sendRedirect(ctxPath + "/index.jsp");
        return;
    }
%>
<%@include file="../header.jsp"%>
<script type="text/javascript" src="../js/modifyInfo_admin.js"></script>
<link rel="stylesheet" type="text/css" , href="<%=cssDir%>/findaccount.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">계정찾기</h3>
    </div>
    <div class="div_mainDiv">
        <h1 style="font-size: 3.5em;">본인의 전화번호를 입력해주세요</h1>
        <form method="post" action="findaccount2.jsp">
            <input style="
    font-size: 4em;
    text-align: center;
    width: 100%;
    height: 10%;
    margin-bottom: 1em;
    border-radius: 30px;
                   type="text" name="tell" placeholder="(-) 하이폰 없이 숫자만 입력" />
            <input type="submit" style="
    font-size: 3em;
    text-align: center;
    width: 100%;
    height: 10%;
    margin-bottom: 1em;
    background: #ec8032;
    color: #ffffff;
    border-radius: 30px;">
        </form>

    </div>
</main>
<%@include file="../footer.jsp"%>