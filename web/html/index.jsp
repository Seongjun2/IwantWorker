<%@ page import="DAO.BannerDAO" %>
<%@ page import="VO.BannerVO" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.BannerDAO_Impl" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="header.jsp"%>
<%
    BannerDAO dao = new BannerDAO_Impl();
    List<BannerVO> banner_list = null;
    try {
         banner_list = dao.findAll();
    } catch (Exception ignored) {
        System.out.println("[ERROR] 배너 이미지 로딩중 에러가 발생하였습니다");
    }
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
            <% if(banner_list.size() == 0) { %>
            <img id="banner_1" src="<%= imgDir %>/noImage.png" />
            <% } else {
                for(BannerVO vo : banner_list) { %>
                <img id="banner_1" src="<%= __PATH__ %>/uploadImg/<%= vo.getImage() %>" />
                <% }
            } %>
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
                    <li>
                        <div class="main_content_title">이거슨 용성이의 처뻔째 게시글 이다</div>
                        <div class="main_content_date">19.07.26</div>
                    </li>
                    <li>
                        <div class="main_content_title">마늘 캐기 알바 하실?</div>
                        <div class="main_content_date">19.07.27</div>
                    </li>
                    <li>
                        <div class="main_content_title">귤 나르실 뿐? 시급 10000원!</div>
                        <div class="main_content_date">19.07.28</div>
                    </li>
                </ul>
            </div>
        </article>
    </div>
</main>
<%@include file="footer.jsp"%>