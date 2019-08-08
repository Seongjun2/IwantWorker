<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../html/header.jsp"%>
<link rel="stylesheet" type="text/css", href="<%=router.error.css%>/error.css">
<main>
    <img id="error_img" src="<%=router.error.imgs%>/403.png" />
    <a href="<%=request.getContextPath()%>/html/index.jsp"><button id="go_main">메인으로 돌아가기</button></a>
</main>
<%@include file="../html/footer.jsp"%>