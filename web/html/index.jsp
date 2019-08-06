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
    List<BoardVO> boardVOList = boardDAO.findAll();
%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/main.css">
<script type="text/javascript" src="<%= jsDir %>/main.js"></script>
<main id="main">
    <div id="main_search">
        <span id="main_search_span">
            <form id="main_search_form">
                <input id="main_search_text" type="text" name="search" placeholder="검색어를 입력하세요" onclick="onFocusSearch()" />
            </form>
            <div id="main_search_icon">
                <img src="<%= imgDir %>/lenz.png" />
            </div>
        </span>
        <div id="search_blank" onclick="disFocusSearch()"></div>
    </div>
    <div id="main_head">
        <div id="main_head_div">
            <%
            if(banner_list.size() == 0) {
                out.print("<img id=\"banner_1\" src=\""+imgDir+"/noImage.png\" />");
            } else {
                for(int i = 0; i < banner_list.size(); i++) {
                    out.print("<img id=\"banner_"+(i+1)+"\" src=\""+__PATH__+"/uploadImg/"+ banner_list.get(i).getImage() +"\" />");
                }
            }
            %>
        </div>
    </div>
    <div id="main_content">
        <article>
            <div id="main_content_header">
                <span><strong>구인 게시판</strong></span>
                <img src="./imgs/plus_icon.png" />
            </div>
            <div id="main_content_content">
                <ul>
                    <% for(int i = 0; i < 3; i++) { %>
                    <li>
                        <div class="main_content_title"><%= "게시글이 없습니다" %></div>
                        <div class="main_content_date"><%= "2019.08.06" %></div>
                    </li>
                    <% } %>
                </ul>
            </div>
        </article>
    </div>
</main>
<%@include file="footer.jsp"%>