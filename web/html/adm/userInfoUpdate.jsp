<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<<<<<<< HEAD
<%@ page import="enums.Permission" %>
<%@ page import="VO.UserVO" %>
<%@ page import="routes.Router" %>
=======
<%@ page import="Util.Util" %>
>>>>>>> admin
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Router router = Router.getInstance(request.getContextPath());

    String tell = request.getParameter("tell");
    String pw = request.getParameter("pw");

<<<<<<< HEAD
    Integer uuid = (Integer) session.getAttribute("uuid");
    Integer user_level = (Integer) session.getAttribute("user_level");
%>
<%
    String enc_pw = Util.md5("admin");
    UserDAO dao = new UserDAO_Impl();
    dao.update(tell, enc_pw, uuid);

%>
<html>
<head>
    <title>userInfoUpdate</title>
    <script>
        alert('성공적으로 수정되었습니다.');
        if (<%= user_level == Permission.ADMIN.getLevel() %>) {
            location.href='<%= router.admin.userlist %>';
        } else if ( <%= user_level == Permission.MEMBER.getLevel() %>) {
            location.href='<%= router.main.index %>';
        }
    </script>
</head>
<body>

</body>
</html>
