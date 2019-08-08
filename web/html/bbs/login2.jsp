<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page import="VO.UserVO" %>
<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="UTF-8"%>
<%
    String ctxPath = request.getContextPath() + "/html";
    String tell = request.getParameter("tell");
    String pw = request.getParameter("pw");
    UserDAO dao = new UserDAO_Impl();

    if ( ctxPath == null || tell == null || pw == null ) {
        response.sendRedirect(ctxPath + "/bbs/login.jsp");
        return;
    }
    try {
        UserVO vo = dao.getUserInfo2(tell);
        if ( vo != null ) {
            if ( vo.getPw().equals(Util.md5(pw)) ) {
                System.out.println("???");
                session.setAttribute("uuid" , vo.getUuid());
                session.setAttribute("user_level" ,vo.getPermission());
                out.print("<script>alert('로그인에 성공하였습니다.');</script>");
                out.print("<script>location.href=\"" + ctxPath + "/index.jsp\";</script>");
                return;
            } else {
                session.setAttribute("error", "pw");
                out.print("<script>location.href=\"" + ctxPath + "/bbs/login.jsp\";</script>");
                return;
            }
        } else {
            session.setAttribute("error", "id");
            out.print("<script>location.href=\"" + ctxPath + "/bbs/login.jsp\";</script>");
            return;
        }
    } catch ( Exception e ) {
        session.setAttribute("error", "account");
        out.print("<script>location.href=\"" + ctxPath + "/bbs/login.jsp\";</script>");
        return;
    }
%>