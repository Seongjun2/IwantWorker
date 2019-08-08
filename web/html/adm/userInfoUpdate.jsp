<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="routes.Router" %>
<%@ page import="enums.Permission" %>
<%@ page import="Util.Util" %>
<%@ page import="VO.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Router router = Router.getInstance(request.getContextPath());

    String tell = request.getParameter("tell");
    String pw = request.getParameter("pw");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");

    Integer uuid = -1;
    Integer user_level = (Integer) session.getAttribute("user_level");
    if (user_level == Permission.ADMIN.getLevel()) {
        uuid = Integer.parseInt(request.getParameter("uuid"));
    } else if (user_level == Permission.MEMBER.getLevel()) {
        uuid = (Integer) session.getAttribute("uuid");
    }
%>
<%
    String enc_pw = Util.md5(pw);
    UserDAO dao = new UserDAO_Impl();
    UserVO beforeUser = dao.getUserInfo(uuid);

    if (tell == null || tell.equals("")) tell = beforeUser.getTell();
    if (pw == null || pw.equals("")) pw = beforeUser.getPw();
    if (question == null || question.equals("")) question = beforeUser.getQuestion();
    if (answer == null || answer.equals("")) answer = beforeUser.getAnswer();

    dao.update(tell, enc_pw, question, answer, uuid);

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
