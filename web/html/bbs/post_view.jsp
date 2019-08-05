<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-04
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "./../css";
    String jsDir = "./../js";
    String imgDir = "./../imgs";
%>
<%@include file="./../header.jsp"%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/post_view.css">
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
                <div class="circle_content">10만원</div>
                <div class="circle_content">7:00 ~ 10:00</div>
                <div class="circle_content">안덕면 색달리</div>
            </div>
        </div>
        <hr color="black" style="width: 100%">
        <div class="etc">
            <ul>
                <li>작물 | 마늘</li>
                <li>작업 | 수확, 나르기</li>
                <li>모집기간 | 19.07.01 ~ 19.07.09</li>
            </ul>
        </div>
        <div class="memo">
            여
            기
            는
            기타 공간
        </div>
        <div style="width: 100%">
                <button class="button_writer">수정하기</button>
                <button class="button_writer">삭제하기</button>
    <%--            <button class="button_guest">홈으로</button>--%>
        </div>
    </div>
</main>
<%@include file="./../footer.jsp"%>
