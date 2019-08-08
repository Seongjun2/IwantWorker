<%@ page import="DAO.BannerDAO" %>
<%@ page import="DAO.BannerDAO_Impl" %>
<%@ page import="VO.BannerVO" %>
<%@ page import="java.util.List" %>
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
%>
<link rel="stylesheet" type="text/css", href="<%= cssDir %>/new_main.css">
<script type="text/javascript" src="<%= jsDir %>/new_main.js"></script>
<main id="new_main">
    <div id="new_main_banner">
        <div id="new_main_banner_div">
            <%
                if(banner_list.size() == 0) {
                    out.print("<img id=\"banner_1\" src=\""+imgDir+"/noImage.png\" />");
                } else {
                    for(int i = 0; i < banner_list.size(); i++) {
                        out.print("<img id=\"banner_"+(i+1)+"\" src=\""+__PATH__+"/uploadImg/"+ /*banner_list.get(i).getImage()*/"temp_"+(i+1)+".jpg\" />");
                    }
                }
            %>
        </div>
    </div>
    <div id="new_main_content">
        <div class="new_main_content_area"></div>
        <div class="new_main_content_area"></div>
        <div class="new_main_content_area"></div>
    </div>
</main>
<%@include file="footer.jsp"%>