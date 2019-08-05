<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="java.util.*" %>
<%@ page import="database.JdbcTemplate" %>
<%@ page import="database.Test" %>
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
//    String sql = "insert into user values ( default , '" + tell + "','" + name + "','" + pw + "', 2" + "," + 0 + ")";
    String sql = "insert into user values ( default , ?, ? , ? , 2 , 0 )";
    //System.out.println(sql);
//    jdbcTemplate.update(sql , tell, name, pw);
//    System.out.println(1);
//    JdbcTemplate jdbcTemplate = new JdbcTemplate();
//    Test t = new Test();
//    t.a();
//
//    jdbcTemplate.l();
//    jdbcTemplate.update( sql , tell,  name , pw);
//    dao.update( tell, name, pw);
    dao.add( tell, name, pw);
//    System.out.println(2);
    response.sendRedirect(ctxPath + "/html/signup.jsp");
%>