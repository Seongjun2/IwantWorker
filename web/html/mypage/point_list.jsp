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
        <h3 class = "h3_pageName">포인트 변동기록</h3>
    </div>
    <div class="div_mainDiv">
        <table class="table_list">
            <thead class="table_head">
            <tr>
                <td>사용<br/>번호</td>
                <td>내용</td>
                <td>변동</td>
                <td>잔여<br>포인트</td>
                <td>변동일자</td>
            </tr>
            </thead>
            <tbody class="table_body">
            <tr>
                <td>13</td>
                <td>포인트 충전</td>
                <td>+500</td>
                <td>1500</td>
                <td class="td_date">2019.07.20</td>
            </tr>
            <tr>
                <td>14</td>
                <td>
                    <a href="#" class="post_link">마농따러옵서</a> 게시글 작성
                </td>
                <td>+500</td>
                <td>1500</td>
                <td class="td_date">2019.07.20</td>
            </tr>
            <tr>
                <td>14</td>
                <td>
                    <a href="#" class="post_link">메롱메롱메롱</a> 게시글 작성
                </td>
                <td>+500</td>
                <td>1500</td>
                <td class="td_date">2019.07.20</td>
            </tr>
            <tr>
                <td>14</td>
                <td>
                    <a href="#" class="post_link">마농따러옵서</a> 게시글 작성
                </td>
                <td>+500</td>
                <td>1500</td>
                <td class="td_date">2019.07.20</td>
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