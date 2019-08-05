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
    String pw = request.getParameter("pw");
    UserDAO dao = new UserDAO_Impl();
    List<UserVO> rl = dao.getUserInfo();
    response.sendRedirect(ctxPath + "/html/bbs/signup.jsp");
%>