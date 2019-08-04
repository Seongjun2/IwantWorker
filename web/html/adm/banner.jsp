<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>

<%!
    String cssDir = "../css";
    String jsDir = "../js";
    String imgDir = "../imgs";
%>
<html>
<head>
    <title>banner upload</title>
</head>
<body>
<%@include file="../header.jsp"%>

<main id="main">
    <div class="pageName">
        <h3 class="h3_pageName">배너 업로드</h3>
    </div>
    <div id="test">
        <div class="div_addBanner">
            <img class="img_addImg" src="../imgs/plus_icon.png" />
        </div>
        <div class="div_addBanner">
            <img class="img_addImg" src="../imgs/plus_icon.png" />
        </div>
        <div class="div_addBanner">
            <img class="img_addImg" src="../imgs/plus_icon.png" />
        </div>
    </div>
</main>
<%@include file="../footer.jsp"%>
</body>
<link rel="stylesheet" type="text/css", href="<%=cssDir%>/banner_admin.css">
</html>