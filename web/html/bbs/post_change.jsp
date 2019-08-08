<%@ page import="DAO.BoardDAO" %>
<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="VO.BoardVO" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-08
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%

    Integer bo_id = Integer.parseInt(request.getParameter("bo_id"));
    BoardDAO dao = new BoardDAO_Impl();

    BoardVO vo = dao.findByBoID(bo_id);
    String money = String.format("%.1f", vo.getMoney()/10000.0);
%>

<%@include file="./../header.jsp"%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/post_write.css">
<script type="text/javascript">
    function confirm_money(){
        var money = document.getElementById('pay').value;
        alert((money/10000.0).toFixed(1) + "만 원");
    };
</script>
<main>
    <div class="div_pageName">
        <h3 class = "h3_pageName">구인 게시글 작성</h3>
    </div>
    <span class="div_mainDiv">
        <div id="posting">
            <form method="POST" action="post_add.jsp">
                <div style="width: 30%; float: left">
                    <ul>
                        <li>제목</li>
                        <li>모집기간</li>
                        <li>작업시간</li>
                        <li>일급</li>
                        <li>위치</li>
                    </ul>
                </div>
                <div style="width: 70%; float: left">
                    <ul>
                        <li>
                            <div style="width: 100%; float: left">
                                <input type="text" size="100px" name="title" value="<%=vo.getText()%>" style="width: 80%"/>
                            </div>
                            <br />
                        </li>
                        <li>
                            <div>
                                <input type="date" name="startDate" class="date" value="<%=vo.getStartDate().substring(0, 10)%>"/>
                                 ~ <input type="date" name="endDate" class="date" value="<%=vo.getEndDate().substring(0, 10)%>"/>
                            </div>
                        </li>
                        <li>
                            <div style="width: 100%;">
                                <div style="width: 100%; float: left;">
                                    <input type="time" size="100px" name="startTime" value="<%=vo.getWorkTime().substring(0, 5)%>" style="width: 35%"/>
                                     ~ <input type="time" size="100px" name="endTime" value="<%=vo.getWorkTime().substring(8)%>" style="width: 35%"/>
                                </div>
                                <br />
                            </div>
                        </li>
                        <li>
                            <div style="width: 100%; float: left">
                                <span> <%=money%> 만 원 </span>
                                <button type="button" class="money" style="font-size:0.8em; width:30%; height: 70px; padding-top: 10px" onclick="confirm_money()">가격 확인</button>
                            </div>
                            <br />
                        </li>
                        <li>
                            <div style="width: 100%; float: left">
                                <input type="text" value="<%=vo.getAddress()%>" size="100px" name="location" style="width: 80%" placeholder="읍면리"/>
                            </div>
                            <br />
                        </li>
                    </ul>
                </div>
                <br />
                <hr>
                <div class="content">
                    <span>내용</span>
                    <div style="padding-top: 30px">
                        <textarea wrap="hard" name="content" value="<%=vo.getContent()%>"></textarea>
                    </div>
                </div>
                <div style="text-align: center">
                    <input type="submit" class="submit" value="올리기" style="width: 4em; padding: 20px;"/>
                    <input type="button" id="cancel" value="뒤로 가기"
                           style="width: 4.5em; padding: 20px;" onclick="history.back()"/>
                </div>
            </form>
<%--            <div class="cancel" style="text-align: center">--%>
<%--                <button>뒤로 가기</button>--%>
<%--            </div>--%>
        </div>
    </span>
</main>
<%@include file="./../footer.jsp"%>
