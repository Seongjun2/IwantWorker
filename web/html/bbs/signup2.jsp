<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.*" %>
<%@ page import="database.JdbcTemplate" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="database.ConnectDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<%
    request.setCharacterEncoding("euc-kr");
    String ctxPath = request.getContextPath();
    String tell = request.getParameter("tell");
    String name = request.getParameter("name");
    String pw = request.getParameter("pw");
    String pw_check = request.getParameter("pw_check");

    UserDAO dao = new UserDAO_Impl();
    dao.add( tell, name, pw );
    response.sendRedirect(ctxPath + "/html/boradori/signup.jsp");
%>