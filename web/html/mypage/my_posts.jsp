<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">�� �Խñ� ���</h3>
    </div>
    <div class="div_mainDiv">
        <div class="board_wrapper">
            <div class="board_post">
                <div class="board_title"> �غ����Դϴ�. </div>
                <div class="board_content">
                    <ul>
                        <li> �� | ��Ȯ </li>
                        <li> 19.07.15 ~ 19.08.09 </li>
                        <li> ��� : 10���� </li>
                        <li> ���ֽ�û </li>
                    </ul>
                </div>
            </div>
            <div class="board_post">
                <div class="board_title"> �� �ɾ� �� �ɾ�  </div>
                <div class="board_content">
                    <ul>
                        <li> �� | ��Ȯ </li>
                        <li> 19.07.15 ~ 19.08.09 </li>
                        <li> ��� : 10���� </li>
                        <li> ���ֽ�û </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../pagination.jsp"%>
</main>
<%@include file="../footer.jsp"%>