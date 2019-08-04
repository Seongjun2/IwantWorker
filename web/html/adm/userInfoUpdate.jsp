<%@ page import="VO.UserVO" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String tell = request.getParameter("tell");
    String pw = request.getParameter("pw");
    int uuid = Integer.parseInt(session.getAttribute("uuid").toString());

    UserDAO dao = new UserDAO_Impl();
    dao.update(tell, pw, uuid);

    response.sendRedirect("./userList_Admin.jsp");

%>
<html>
<head>
    <title>userInfoUpdate</title>
</head>
<body>

</body>
</html>
