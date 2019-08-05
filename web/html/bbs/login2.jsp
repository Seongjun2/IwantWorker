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

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://15.164.79.177:3306/leaguelugas?serverTimezone=UTC","leaguelugas","8426753190");
    Statement stmt = conn.createStatement();
    String sql = "select * from user where Tell=" + "\"" + tell + "\"" + "AND " + "Pw= \"" + pw + "\"";
    System.out.println(sql);
    ResultSet rs = stmt.executeQuery(sql);

    while ( rs.next() ) {
        System.out.println( rs.getInt("uuid"));
        System.out.println( rs.getString("Tell"));
        System.out.println( rs.getString("name"));
        System.out.println( rs.getString("pw"));
        System.out.println( rs.getInt("point"));
    }
    session.setAttribute("user_id" , pw);

//    UserDAO dao = new UserDAO_Impl();
//    List<UserVO> rl = dao.getUserInfo();

    stmt.close();
    conn.close();
    response.sendRedirect(ctxPath + "/html/index.jsp");
%>