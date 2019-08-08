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
<script type="text/javascript" src="../js/findaccount.js"></script>
<link rel="stylesheet" type="text/css" , href="<%=cssDir%>/findaccount.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">계정찾기</h3>
    </div>
    <div class="div_mainDiv">
        <h1>본인의 전화번호를 입력해주세요</h1>
        <form method="post" action="findaccount2.jsp">
            <input id="text" pattern="\d*" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" onkeydown="return max_length( event );" onkeypress="submit_enter(event)" type="number" name="tell" placeholder="(-) 하이폰 없이 숫자만 입력" />
            <input type="button" id="input_submit" value="제출" onclick="submit()">
        </form>

    </div>
</main>
<%@include file="../footer.jsp"%>