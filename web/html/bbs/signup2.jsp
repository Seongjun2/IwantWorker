<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.*" %>
<%@ page import="database.JdbcTemplate" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="database.ConnectDB" %>
<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String ctxPath = request.getContextPath();
    String tell = request.getParameter("tell");
    String name = request.getParameter("name");
    String pw = request.getParameter("pw");
    String pw_check = request.getParameter("pw_check");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");
    UserDAO dao = new UserDAO_Impl();
    try {
        UserVO vo = dao.getUserInfo(tell);
        if ( tell.equals( vo.getTell() ) ) {
            session.setAttribute("error", "id");
            out.print("<script>location.href=\"" + ctxPath + "/html/bbs/signup.jsp\";</script>");
            return;
        }
    } catch ( Exception e ) {
        dao.add( tell, name , Util.md5(pw), question, answer );
    }
    response.sendRedirect( ctxPath + "/html/bbs/login.jsp");
%>
