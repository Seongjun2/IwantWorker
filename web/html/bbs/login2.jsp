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
<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<%
    System.out.println("---------------------");
    String ctxPath = request.getContextPath();
    String tell = request.getParameter("tell");
    String pw = Util.md5( request.getParameter("pw") );
    request.setCharacterEncoding("euc-kr");

    UserDAO dao = new UserDAO_Impl();
    try {
        UserVO vo = dao.getUserInfo(tell);
        if ( vo.getPw().equals(pw) ) {
            System.out.println(vo.getUuid());
            session.setAttribute("uuid" , (Integer)vo.getUuid());
            session.setAttribute("user_level" ,(Integer)vo.getPermission());
        } else {
            session.setAttribute("error", "pw");
            out.print("<script>location.href=\"" + ctxPath + "/html/bbs/login.jsp\";</script>");
            return;
        }

    } catch ( Exception e) {
        session.setAttribute("error", "id");
        out.print("<script>location.href=\"" + ctxPath + "/html/bbs/login.jsp\";</script>");
        return;
    }

    response.sendRedirect(ctxPath + "/html/index.jsp");
%>