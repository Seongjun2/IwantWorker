<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="DAO.BoardDAO" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-03
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %><%
    String ctxPath = request.getContextPath();

    Integer uuid = Integer.parseInt(session.getAttribute("uuid").toString());
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String workTime = request.getParameter("startTime") + " ~ " + request.getParameter("endTime");
    int money = Integer.parseInt(request.getParameter("money"));
    String addr = request.getParameter("location");


    SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
    String format_time = format.format (System.currentTimeMillis());

    String time = format_time;

    BoardDAO dao = new BoardDAO_Impl();
    try {
//        dao.add(uuid, title, content, startDate, endDate, workTime, money, addr, time);
        dao.add(uuid, title, content, startDate, endDate, workTime, money, addr);
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect(ctxPath + "/html/bbs/board_list.jsp");
%>