<%@ page import="DAO.BoardDAO" %>
<%@ page import="DAO.BoardDAO_Impl" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-08
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%
    String ctxPath = request.getContextPath();
    Integer bo_id = Integer.parseInt(request.getParameter("bo_id"));

    BoardDAO dao = new BoardDAO_Impl();
    dao.deleteByBoID(bo_id);

    response.sendRedirect(ctxPath + "/html/bbs/board_list.jsp");
%>