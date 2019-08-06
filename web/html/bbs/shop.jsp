<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //loginCheck(request,response);
%>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/shop.css">
<script type="text/javascript" src="<%= jsDir %>/shop.js"></script>
<main id="shop">
    <div class="div_pageName">
        <h3 class = "h3_pageName">한라봉 포인트 충전</h3>
    </div>
    <div id="shop_content" class="div_mainDiv">
        <div id="shop_title">
            <strong>상품 목록</strong>
        </div>
        <div id="shop_list">
            <ul id="shop_list_content">
                <li id="shop_list_item_1" onclick="chose_item(1)">
                    <div class="shop_list_item_point">
                        <span id="shop_list_item_point_1">5500</span>봉
                    </div>
                    <div class="shop_list_item_price">
                        <span id="shop_list_item_price_1">5000</span>원
                    </div>
                </li>
                <li id="shop_list_item_2" onclick="chose_item(2)">
                    <div class="shop_list_item_point">
                        <span id="shop_list_item_point_2">12500</span>봉
                    </div>
                    <div class="shop_list_item_price">
                        <span id="shop_list_item_price_2">10000</span>원
                    </div>
                </li>
                <li id="shop_list_item_3" onclick="chose_item(3)">
                    <div class="shop_list_item_point">
                        <span id="shop_list_item_point_3">40000</span>봉
                    </div>
                    <div class="shop_list_item_price">
                        <span id="shop_list_item_price_3">30000</span>원
                    </div>
                </li>
            </ul>
        </div>
        <div id="shop_des">결제는 무통장 입금으로 진행되며,<br />결재하기 버튼을 누르시면 계좌번호를 알려드립니다</div>
        <form id="shop_form" action="payment.jsp" method="post">
            <p id="shop_button_price"></p>
            <input id="shop_pay_point" type="hidden" name="point" value="">
            <input id="shop_pay_price" type="hidden" name="price" value="">
            <button type="button" onclick="pay()">결재하기</button>
        </form>
    </div>
</main>
<%@include file="../footer.jsp"%>