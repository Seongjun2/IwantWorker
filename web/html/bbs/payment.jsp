<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp"%>
<%
    String endTime = null;

    Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    Calendar cal = Calendar.getInstance();
    cal.setTime(date);
    cal.add(Calendar.DATE, 2);

    endTime = dateFormat.format(cal.getTime());

    String price = request.getParameter("price");
%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/payment.css">
<main id="payment">
    <div class="div_pageName">
        <h3 class = "h3_pageName">결제 안내</h3>
    </div>
    <div id="payment_content" class="div_mainDiv">
        <div id="payment_info">
            <strong>무통장 입금 계좌</strong>
            <p>신한 110-501-368172 임용성</p>
            <p>- <%=price%>원</p><br /><br />
            <p><%=endTime%> 까지 입금하지</p>
            <p>않을 경우 결제가 취소됩니다.</p>
            <p>입금자 명은 로그인한 이름과 일치해야 합니다.</p>
        </div>
        <div id="payment_back_button">
            <button onclick="location.href='<%=__PATH__%>/index.jsp'">첫화면으로 돌아가기</button>
        </div>
    </div>
</main>
<%@include file="../footer.jsp"%>