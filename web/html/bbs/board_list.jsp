<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<%!
    String cssDir = "./../css";
    String jsDir = "./../js";
    String imgDir = "./../imgs";
%><%@include file="./../header.jsp"%>
<%--header�� head, footer�� body, html �±� �� ����. ���� �ȵ�--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">�Խ���</h3>
    </div>
    <div class="div_mainDiv" style="align-content: center">
        <button id="write_button" onclick="location.href='${pageContext.request.contextPath}/html/bbs/post_write.jsp'"> �۾��� </button>
        <div id="board_post">
            <div id="board_title"> �غ����Դϴ�. </div>
            <div id="board_content">
                <ul>
                    <li> �� | ��Ȯ </li>
                    <li> 19.07.15 ~ 19.08.09 </li>
                    <li> ��� : 10���� </li>
                    <li> ���ֽ�û </li>
                </ul>
            </div>
        </div>
        <div id="order_button">
            <button> < </button>
            <% for(int i=1;i<=3;i++){%>
            <button><%=i%></button>
            <%}%>
            <button> > </button>
        </div>
    </div>
</main>
<%@include file="./../footer.jsp"%>