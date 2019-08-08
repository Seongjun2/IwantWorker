<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="DAO.BoardDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-08
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %><%
    Integer bo_id = Integer.parseInt(request.getParameter("bo_id"));

    String ctxPath = request.getContextPath();

    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String workTime = request.getParameter("startTime") + " ~ " + request.getParameter("endTime");
    String addr = request.getParameter("location");


    SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
    String format_time = format.format (System.currentTimeMillis());

    String time = format_time;

    BoardDAO dao = new BoardDAO_Impl();
    try {
        dao.update(title, content, startDate, endDate, workTime, addr, time, bo_id);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect(ctxPath + "/html/bbs/board_list.jsp");
%>