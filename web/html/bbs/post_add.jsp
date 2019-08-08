<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="DAO.BoardDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="routes.Router" %>
<%@ page import="Util.Util" %>
<%@ page import="database.JdbcTemplate" %>
<%@ page import="VO.UserVO" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-03
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<html>
<body>
<%
    UserVO userVO = (UserVO) session.getAttribute("vo");
    session.removeAttribute("vo");
    Router router = Router.getInstance(request.getContextPath());

    Integer uuid = Integer.parseInt(session.getAttribute("uuid").toString());
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String workTime = request.getParameter("startTime") + " ~ " + request.getParameter("endTime");
    int money = Util.parseIntOr(request.getParameter("money"), 0);
    String addr = request.getParameter("location");


    SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
    String format_time = format.format (System.currentTimeMillis());

    String time = format_time;

    if(title.equals("") || content.equals("") || startDate.equals("") || endDate.equals("") || workTime.equals("") || money==0){
        out.print("<script>alert('빈칸을 모두 채워주세요');</script>");
        out.print("<script>history.back();</script>");
        return;
    }

    BoardDAO dao = new BoardDAO_Impl();
    try {
//        dao.add(uuid, title, content, startDate, endDate, workTime, money, addr, time);
        dao.add(uuid, title, content, startDate, endDate, workTime, money, addr);
    } catch (Exception e) {
        e.printStackTrace();
    }

    JdbcTemplate db = new JdbcTemplate();
    try {
        db.update("update user set point = ? where uuid = ?", (userVO.getPoint()-400),uuid);
        db.update("insert into pointlog values (default, ?, ?, ?, ?, now())", uuid, "게시글 작성", -400, (userVO.getPoint()-400));
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect(router.board.board_list);
%>
</body>
</html>