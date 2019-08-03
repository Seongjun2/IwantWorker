<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "./../css";
    String jsDir = "./../js";
    String imgDir = "./../imgs";
%><%@include file="./../header.jsp"%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/post_write.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">구인 게시글 작성</h3>
    </div>
    <div class="div_mainDiv" style="align-content: center">
        <div id="posting">
            <form method="POST" action="post_add.jsp" style="text-align: center">
                <div>
                    제목 <input type="text" size="100px" name="title" />
                </div>
                <br />
                <div>
                    모집기간 <input type="date" name="startDate" />
                     ~ <input type="date" name="endDate" />
                </div>
                <div>
                    <select name="crop">
                        <option value="귤">귤</option>
                        <option value="한라봉">한라봉</option>
                        <option value="천해향">천해향</option>
                        <option value="마늘">마늘</option>
                        <option value="감자">감자</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
            </form>
        </div>
    </div>
</main>
<%@include file="./../footer.jsp"%>