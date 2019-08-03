<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    String cssDir = "./../css";
    String jsDir = "./../js";
    String imgDir = "./../imgs";
%>
<%@include file="./../header.jsp"%>
<link rel="stylesheet" type="text/css", href="../css/mypage.css">

<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">내 결제 목록</h3>
    </div>
    <div class="div_mainDiv">
        <table class="table_list">
            <thead class="table_head">
                <tr>
                    <td>결제<br/>번호</td>
                    <td>충전<br/>포인트</td>
                    <td>가격</td>
                    <td>결제일자</td>
                    <td>상태</td>
                </tr>
            </thead>
            <tbody class="table_body">
                <tr>
                    <td>10</td>
                    <td>+500</td>
                    <td>5,000</td>
                    <td class="td_date">2019.07.20</td>
                    <td>처리됨</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>+500</td>
                    <td>5,000</td>
                    <td class="td_date">2019.07.20</td>
                    <td>취소됨</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>+500</td>
                    <td>5,000</td>
                    <td class="td_date">2019.07.20</td>
                    <td>입금확인중</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <%@include file="../pagination.jsp"%>
</main>

<%@include file="./../footer.jsp"%>