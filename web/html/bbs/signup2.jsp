<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="utf-8"%>
<%
    String ctxPath = request.getContextPath() + "/html";
    String tell = request.getParameter("tell");
    String name = request.getParameter("name");
    String pw = request.getParameter("pw");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");
    UserDAO dao = new UserDAO_Impl();
    if ( session.getAttribute("uuid") != null ) {
        response.sendRedirect(ctxPath + "/index.jsp");
        return;
    }
    if ( ctxPath == null || tell == null || name == null || pw == null || question == null || answer == null ) {
        response.sendRedirect(ctxPath + "/bbs/signup.jsp");
        return;
    }
    try {
        UserVO vo = dao.getUserInfo2(tell);
        if ( tell.equals( vo.getTell() ) ) {
            session.setAttribute("error", "id");
            out.print("<script>location.href=\"" + ctxPath + "/bbs/signup.jsp\";</script>");
            return;
        }
    } catch ( Exception e ) {
        dao.add( tell, name , Util.md5(pw), question, answer );
        session.setAttribute("success", "success");
        out.print("<script>location.href=\"" + ctxPath + "/bbs/signup.jsp\";</script>");
    }
%>
