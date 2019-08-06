<%@ page import="VO.BoardVO" %>
<%@ page import="DAO.BoardDAO" %>
<%@ page import="DAO.BoardDAO_Impl" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-06
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %><%
    Integer bo_id = Integer.parseInt(request.getParameter("bo_id"));

    BoardDAO dao = new BoardDAO_Impl();
    System.out.println(bo_id);

    BoardVO vo = dao.findByBoID(bo_id);
    System.out.println(vo.getMoney());
    System.out.println(vo.getText());

%>
