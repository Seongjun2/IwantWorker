<%@ page import="VO.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.BoardDAO_Impl" %>
<%@ page import="Util.PreventSQLInjection" %>
<%@ page import="DAO.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="../header.jsp"%>
<%
    String search = request.getParameter("search");

    if(search==null) search = "";
    BoardDAO_Impl dao = new BoardDAO_Impl();

    List<BoardVO> list = new ArrayList<BoardVO>();

    try {
        list = dao.findAll(search);
    } catch (Exception e) {
        e.printStackTrace();
    }


    if (!PreventSQLInjection.passOrNot(search)) {
        response.sendRedirect(router.board.board_list);
    }
%>
<%--<% System.out.println(router.board.post_get); %>--%>
<%--header에 head, footer에 body, html 태그 들어가 있음. 쓰면 안됨--%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/board.css">
<script>
    function onFocusSearch() {
        document.getElementById('main_search_span').style.border = '3px solid #000000';
        document.getElementById('main_search_span').style.transform = 'translate(0, -3%)';
        document.getElementById('main_search_span').style.height = '61%';
        document.getElementById('main_search_span').style.width = '91%';
    }
    function disFocusSearch() {
        document.getElementById('main_search_span').style.border = '0';
        document.getElementById('main_search_span').style.transform = 'translate(0, 0)';
        document.getElementById('main_search_span').style.height = '60%';
        document.getElementById('main_search_span').style.width = '90%';
    }
</script>
<main>
    <div id="main_search">
        <span id="main_search_span">
            <form id="main_search_form" action="<%=router.board.board_search%>" method="get">
                <input id="main_search_text" type="text" name="search" placeholder="검색어를 입력하세요" onclick="onFocusSearch()" />
            </form>
            <div id="main_search_icon">
                <img src="<%= imgDir %>/lenz.png"/>
            </div>
        </span>
    </div>
    <div class="div_pageName">
        <h3 class = "h3_pageName">게시판</h3>
    </div>
    <div class="div_mainDiv" style="align-content: center; z-index: 2">
        <% if (list.size() == 0) { %>
            <p class="empty_table">
                아직 게시글이 없습니다. <br><br>
                <span class="text-emphasis">구인 게시글을 작성</span>하고 <br>
                간편하게 단기 알바를 구해보세요!
            </p>
            <div class="redirect_wrapper">
                <a href="<%= router.board.post_write %>">
                    <button class="btn_redirect" type="button"> 게시글 작성하러 가기 </button>
                </a>
            </div>
        <% } else { %>
            <% if(session.getAttribute("uuid")!=null) {%>
                <button class="write_button" onclick="location.href='${pageContext.request.contextPath}/html/bbs/post_write.jsp'"> 글쓰기 </button>
            <% } %>
            <% for(BoardVO vo : list) { %>
                <% BoardDAO dao2 = new BoardDAO_Impl();
                    String name = null;
                    try {
                        name = dao2.findNameByBoID(vo.getBoard_id());
                    } catch (Exception e) {
                        e.getMessage();
                        e.printStackTrace();
                    } %>
                <% String money = String.format("%.1f", vo.getMoney()/10000.0); %>
                <div class="board_post" onclick="location.href='<%=router.board.post_view%>?bo_id=<%=vo.getBoard_id()%>'">
                    <div class="board_title"><%=vo.getText()%></div>
                    <div class="board_content">
                        <ul>
                            <li>작성자 : <%=name%></li>
                            <li>기간 : <%=vo.getStartDate().substring(0, 10) + "~" + vo.getEndDate().substring(0, 10)%></li>
                            <li>비용 : <%=money%> 만 원
                            <li>위치 : <%=vo.getAddress()%></li>
                        </ul>
                    </div>
                </div>
            <%}%>
        <%}%>
<%--        <%@include file="./../pagination.jsp"%>--%>
    </div>
</main>
<%@include file="./../footer.jsp"%>