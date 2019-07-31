<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="DAO.UserDAO_Impl"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Jeju</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%--    <link rel="stylesheet" type="text/css", href="../css/mobile.css">--%>
    <link rel="stylesheet" type="text/css", href="../css/common.css?ver=1">
    <link rel="stylesheet" type="text/css", href="../css/userList.css?ver=1">
</head>
<body>
<header>
    <div id="main_header_menu">
        <img id="main_header_menu_btn" src="../imgs/menu_btn.png">
        <img id="main_header_menu_logo" src="../imgs/logo.png" />
    </div>
    <div id="main_header_search">
			<span id="main_header_search_span">
				<div id="main_header_search_icon">
					<img src="../imgs/lenz.png" />
				</div>
				<form id="main_header_search_form">
					<input id="main_header_search_text" type="text" name="search" />
				</form>
			</span>
    </div>
</header>

<main id="main">
    <div id = "div_list">
        <table>
            <tr>
                <td>번호</td>
                <td>이름</td>
                <td>연락처</td>
                <td>수정</td>
            </tr>
            <%
                UserDAO userDao = new UserDAO_Impl();
                List<UserVO> userList = userDao.findAll();
                for(UserVO vo : userList){
            %>
            <tr>
            <td> <%=vo.getUuid()%></td>
            <td> <%=vo.getName()%></td>
            <td> <%=vo.getTell()%></td>
            <td><button>test</button></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</main>

<footer>
    <div><img src="../imgs/logo.png" /></div>
    <span>COPYRIGHT LeagueLugas, ALL RIGHT RESERVED.</span>
    <button id="change_device">PC 버전으로 보기</button>
</footer>
</body>
</html>