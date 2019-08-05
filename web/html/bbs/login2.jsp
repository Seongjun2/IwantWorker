<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.*" %>
<%@ page import="database.JdbcTemplate" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.*"%>
<%@ page import="database.ConnectDB" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<%
    System.out.println("---------------------");
    String ctxPath = request.getContextPath();
    String tell = request.getParameter("tell");
    String pw = request.getParameter("pw");
    request.setCharacterEncoding("euc-kr");

    UserDAO dao = new UserDAO_Impl();
    UserVO vo = dao.getUserInfo(tell);
    System.out.println(vo.getTell());
    System.out.println(vo.getPw());
    if ( vo.getPw().equals(pw) ) {
        System.out.println(2222222);
        System.out.println(vo.getUuid());
        session.setAttribute("uuid" , vo.getUuid());
        session.setAttribute("user_level" , vo.getPermission());
    }
    
    response.sendRedirect(ctxPath + "/html/index.jsp");
%>