<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="DAO.UserDAO_Impl"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="database.ConnectDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>UserList</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css", href="css/common.css">
</head>
<body>

<header>
    <div id="header_menu">
        <img id="header_menu_btn" src="imgs/menu_btn.png">
        <img id="header_menu_logo" src="imgs/logo.png" />
    </div>
    <div id="header_search">
			<span id="header_search_span">
				<div id="header_search_icon">
					<img src="imgs/lenz.png" />
				</div>
				<form id="header_search_form">
					<input id="header_search_text" type="text" name="search" />
				</form>
			</span>
    </div>
</header>

<main>
    <table>
        <tr>
            <td>번호</td>
            <td>이름</td>
            <td>연락처</td>
            <td>수정</td>
        </tr>
    <%--    <%--%>
    <%--        ConnectDB connectDB = new ConnectDB();--%>
    <%--        Connection conn = connectDB.connect();--%>
    <%--        Statement stmt = conn.createStatement();--%>
    <%--        --%>
    <%--        UserDAO dao = new UserDAO_Impl();--%>
    <%--        connectDB.disConnect(conn);--%>

    <%--    %>--%>
    </table>
</main>
<footer>
    <div><img src="imgs/logo.png" /></div>
    <span>COPYRIGHT LeagueLugas, ALL RIGHT RESERVED.</span>
    <button id="change_device">PC 버전으로 보기</button>
</footer>
</body>
</html>