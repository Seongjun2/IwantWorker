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
<%
    Integer level = (Integer)session.getAttribute("user_level");

    if( level == null || level != 10){
        response.sendRedirect(Router.getInstance(request.getContextPath()).main.index);
    }
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
        <form action="./upload.jsp" method="POST" enctype="multipart/form-data">
            <input type='file' id="file1" name='file1' style='display: none;' accept=".jpg, .png, jpeg">
            <div class="div_addBanner" onclick='document.all.file1.click();'>
                <img class="img_addImg" id="add_button1" src="../imgs/plus_icon.png"/>
                <img id = "image_section1" class="img_show" src="#" style="display: none"/>
            </div>
            <input type='file' id="file2" name='file2' style='display: none;'accept=".jpg, .png, jpeg">
            <div class="div_addBanner" onclick='document.all.file2.click();'>
                <img class="img_addImg" id="add_button2" src="../imgs/plus_icon.png"/>
                <img id = "image_section2" class="img_show" src="#" style="display: none"/>
            </div>
            <input type='file' id="file3" name='file3' style='display: none;'accept=".jpg, .png, jpeg">
            <div class="div_addBanner" onclick='document.all.file3.click();'>
                <img class="img_addImg" id="add_button3" src="../imgs/plus_icon.png"/>
                <img id = "image_section3" class="img_show" src="#" style="display: none"/>
            </div>

            <input type="submit" value="업로드" id = "submit_upload"/>
        </form>
    </div>
</main>
<%@include file="../footer.jsp"%>
</body>
    <link rel="stylesheet" type="text/css", href="<%=cssDir%>/banner_admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="../js/addBanner.js"></script>
</html>