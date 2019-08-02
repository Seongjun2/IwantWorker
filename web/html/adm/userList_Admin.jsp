<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>

<html>
<head>
    <title>userList</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="../imgs/favicon.png">
<%--    <link rel="stylesheet" type="text/css", href="../css/mobile.css">--%>
    <link rel="stylesheet" type="text/css", href="../css/common.css">
    <link rel="stylesheet" type="text/css", href="../css/userList.css">
    <link rel="stylesheet" type="text/css", href="../css/common_admin.css">
    <script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
<header id="main_header">
    <div id="main_header_menu">
        <img id="main_header_menu_btn" src="../imgs/main_menu_btn.png">
        <img id="main_header_menu_logo" src="../imgs/logo.png" />
    </div>
    <div id="main_header_search">
			<span id="main_header_search_span">
				<form id="main_header_search_form">
					<input id="main_header_search_text" type="text" name="search" placeholder="�˻�� �Է��ϼ���" />
				</form>
				<div id="main_header_search_icon">
					<img src="../imgs/lenz.png" />
				</div>
			</span>
    </div>
    <div id="header_sidebar">

    </div>
    <div id="header_sidebar_blank"></div>
</header>

<main id="main">
    <div class="pageName">
        <h3>ȸ����� ��ȸ</h3>
    </div>
    <div id = "div_list">
        <table id = "userTable">
            <thead align="center">
                <tr>
                    <th>��ȣ</th>
                    <th>�̸�</th>
                    <th>����ó</th>
                    <th>����</th>
                </tr>
            </thead>
            <tbody align="center">
            <%
                UserDAO userDao = new UserDAO_Impl();
                List<UserVO> userList = userDao.findAll();
                for(UserVO vo : userList){
            %>
            <tr>
                <td> <%=vo.getUuid()%></td>
                <td> <%=vo.getName()%></td>
                <td> <%=vo.getTell()%></td>
<%--                <td><input type="button" value = "����" class="btn_modify"/></td>--%>
                <td>
                    <form action="./modify_userInfo_admin.jsp?uuid=<%=vo.getUuid()%>" method="post">
                        <input type="submit" value = "����" class="btn_modify">
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</main>

<footer>
    <div><img src="../imgs/logo.png" /></div>
    <span>COPYRIGHT LeagueLugas, ALL RIGHT RESERVED.</span>
    <button id="change_device">PC �������� ����</button>
</footer>
</body>
</html>