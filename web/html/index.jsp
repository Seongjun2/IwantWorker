<%@ page import="VO.BannerVO" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.*" %>
<%@ page import="VO.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="header.jsp"%>
<%
    BannerDAO bannerDao = new BannerDAO_Impl();
    List<BannerVO> banner_list = null;
    try {
        banner_list = bannerDao.findAll();
    } catch (Exception ignored) {
        System.out.println("[ERROR] 배너 이미지 로딩중 에러가 발생하였습니다");
    }

    BoardDAO boardDAO = new BoardDAO_Impl();
    List<BoardVO> boardVOList = boardDAO.findAll("");
%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/main.css">
<script type="text/javascript" src="<%= jsDir %>/main.js"></script>
<main id="main">
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
    <div id="main_head">
        <div id="main_head_div">
            <%
                if(banner_list.size() == 0) {
                    out.print("<img id=\"banner_1\" src=\""+imgDir+"/noImage.png\" />");
                } else {
                    for(int i = 0; i < banner_list.size(); i++) {
                        out.print("<img id=\"banner_"+(i+1)+"\" src=\""+request.getContextPath()+"/uploadImg/"+ banner_list.get(i).getImage() +"\" />");
                    }
                }
            %>
        </div>
    </div>
    <div id="main_content_menu">
        <% if(user_level == 0) { %>
            <a href="<%=router.main.login%>"><img class="main_content_menu_item" src="<%=imgDir%>/menu_user_icon_login.png" /></a>
        <% } else { %>
            <a href="<%=__PATH__%>/mypage/modify_myInfo.jsp"><img class="main_content_menu_item" src="<%=imgDir%>/menu_user_icon.png" /></a>
        <% } %>
        <a href="<%=router.board.board_list%>"><img class="main_content_menu_item" src="<%=imgDir%>/menu_board_icon.png" /></a>
        <a href="tel:01077379685"><img class="main_content_menu_item" src="<%=imgDir%>/menu_help_icon.png" /></a>
    </div>
    <div id="main_content">
        <article>
            <div id="main_content_header" onclick="goBoard()">
                <span><strong>구인 게시판</strong></span>
                <img src="./imgs/plus_icon.png" />
            </div>
            <div id="main_content_content">
                <ul>
                    <% for(int i = 0; i < 3; i++) { %>
                    <li>
                        <% try { %>
                        <%
                            Integer bo_id = boardVOList.get(i).getBoard_id();
                            String title = boardVOList.get(i).getText();
                            String date = boardVOList.get(i).getWriteTime().split(" ")[0];
                        %>
                        <a href="bbs/post_view.jsp?bo_id=<%=bo_id%>">
                            <div class="main_content_title"><%=title%></div>
                            <div class="main_content_date"><%=date%></div>
                        </a>
                        <% } catch (Exception e) {%>
                        <a>
                            <div class="main_content_title">게시글이 없습니다...</div>
                            <div class="main_content_date"></div>
                        </a>
                        <% } %>
                    </li>
                    <% } %>
                </ul>
            </div>
        </article>
    </div>
</main>
<%@include file="footer.jsp"%>