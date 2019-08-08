<%@ page import="routes.Router" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-08
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %><%
    Router router = Router.getInstance(request.getContextPath());

    String search = request.getParameter("search");
    System.out.println(search);

    search = new String(search.getBytes("UTF-8"),"8859_1");

    if(search == null) response.sendRedirect(router.board.board_list);
    else response.sendRedirect(router.board.board_list + "?search=" + search);
%>