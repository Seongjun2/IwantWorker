<%@ page import="routes.Router" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %><%--
  Created by IntelliJ IDEA.
  User: sohi8
  Date: 2019-08-09
  Time: 오전 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Router router = Router.getInstance(request.getContextPath());
    Integer uuid = (Integer) session.getAttribute("uuid");

    UserDAO dao = new UserDAO_Impl();

    dao.deleteByUUID(uuid);

    session.removeAttribute("uuid");
    session.removeAttribute("user_level");
%>
<html>
<head>
    <title>userInfoUpdate</title>
    <script>
        alert('성공적으로 탈퇴되었습니다.');
        location.href='<%= router.main.index %>';
    </script>
</head>
<body>

</body>
</html>
