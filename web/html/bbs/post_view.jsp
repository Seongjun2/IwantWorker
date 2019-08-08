<%@ page import="DAO.BoardDAO" %>
<%@ page import="VO.BoardVO" %>
<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="Util.PreventSQLInjection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-04
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="./../header.jsp"%>
<%
    String[] problemCharacter = new String[]{"'", "\"", "`", "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")"};
    String pre_bo_id = request.getParameter("bo_id");
    BoardVO vo = null;
    String money = null;
%>
<%
//    for(int i=0;i<problemCharacter.length;i++){
//        if(pre_bo_id.contains(problemCharacter[i])) {
//            response.sendRedirect(router.board.board_list);
//            return;
//        }
//    }
    if (!PreventSQLInjection.passOrNot(pre_bo_id)) {
        response.sendRedirect(router.board.board_list);
    }
    Integer bo_id = Integer.parseInt(request.getParameter("bo_id"));
    BoardDAO dao = new BoardDAO_Impl();

    try {
        vo = dao.findByBoID(bo_id);
    } catch (Exception e) {
        e.printStackTrace();
    }
    money = String.format("%.1f", vo.getMoney() / 10000.0);

    BoardDAO dao2 = new BoardDAO_Impl();
    //String name = dao2.findNameByBoID(vo.getBoard_id());
    Integer uuid = vo.getUuid();
    String name = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://15.164.79.177:3306/worker?serverTimezone=UTC", "leaguelugas", "8426753190");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select name from user where uuid = "+uuid);
        rs.next();
        name = rs.getString("name");
        rs.close();
        conn.close();
    } catch (Exception e) {}
%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/post_view.css">
<script type="text/javascript" src="<%=jsDir%>/post.js"></script>
<script>
    var param = encodeURI(<%=pre_bo_id%>);
</script>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">구 인</h3>
    </div>
    <div class="div_mainDiv">
        <div class="title"><%=vo.getText()%></div>
        <hr>
        <div class="main_content">
            <div style="width: 100%; height: 100%;">
                <div class="circle" style="margin-left: 50px"><p>일당</p></div>
                <div class="circle"><p>시간</p></div>
                <div class="circle"><p>위치</p></div>
            </div>
            <div style="width: 100%;">
                <div class="circle_content"><%=money%>만원</div>
                <div class="circle_content"><%=vo.getWorkTime()%></div>
                <div class="circle_content"><%=vo.getAddress()%></div>
            </div>
        </div>
        <hr color="black" style="width: 100%">
        <div class="etc">
            <ul>
                <li>작성자 | <%=name%></li>
                <li>모집기간 | <%=vo.getStartDate().substring(0, 10) + "~" + vo.getEndDate().substring(0, 10)%></li>
                <li>내용 | </li>
            </ul>
        </div>
        <div class="memo">
            <p><%=vo.getContent()%></p>
        </div>
        <div style="width: 100%; display: flex; justify-content: center;">
            <% if(session.getAttribute("uuid")!=null) {%>
                <% if ((session.getAttribute("uuid").toString()).equals(vo.getUuid().toString())) {%>
                    <button class="button_writer" onclick="location.href='<%=router.board.post_change%>?bo_id='+param">수정하기</button>
                    <button class="button_writer" onclick="location.href='<%=router.board.post_delete%>?bo_id='+param">삭제하기</button>
                    <button class="button_writer" onclick=location.href='<%=router.board.board_list%>'>게시판</button>
                <% } else { %>
                    <button class="button_guest" onclick=location.href='<%=router.board.board_list%>'>게시판</button>
                <% } %>
            <% } else { %>
                <button class="button_guest" onclick=location.href='<%=router.board.board_list%>'>게시판</button>
            <% } %>
        </div>
    </div>
</main>
<%@include file="./../footer.jsp"%>
