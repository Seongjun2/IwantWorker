<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
    String tell = request.getParameter("tell");
    String pw = Util.md5( request.getParameter("pw") );
    UserDAO dao = new UserDAO_Impl();
    try {
        UserVO vo = dao.getUserInfo2(tell);
        if ( vo.getPw().equals(pw) ) {
            session.setAttribute("uuid" , vo.getUuid());
            session.setAttribute("user_level" ,vo.getPermission());
            out.print("<script>alert('로그인에 성공하였습니다.'); </script>");
            response.sendRedirect(ctxPath + "/html/index.jsp");
            return;
        } else {
            session.setAttribute("error", "pw");
            out.print("<script>location.href=\"" + ctxPath + "/html/bbs/login.jsp\";</script>");
            return;
        }

    } catch ( Exception e ) {
        session.setAttribute("error", "id");
        out.print("<script>location.href=\"" + ctxPath + "/html/bbs/login.jsp\";</script>");
        return;
    }
%>