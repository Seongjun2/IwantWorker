<%@ page import="Util.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String uri = request.getRequestURI();
    int pageNum = 0;
    int lastPageNum = 0;

    try {
        pageNum = Integer.parseInt( request.getParameter("pageNum") );
        lastPageNum = Integer.parseInt( request.getParameter("lastPageNum") );
    } catch ( Exception e ) {
        return;
    }
%>

<link rel="stylesheet" type="text/css", href="../css/pagination.css">
<div class="pagination-wrapper" onchange="test()">
    <div class="pagination">
        <div>
<%--            <a class="prev page-numbers" href="javascript:;">prev</a>--%>
            <%
                for(int j = 0; j < lastPageNum;j++){
                    if(pageNum == j+1){%>
            <span aria-current="page" class="page-numbers current"><%=j+1%></span>
            <%
            }
            else{
            %>
            <a class="page-numbers" href="<%=uri%>?pageNum=<%=j+1%>"><%=j+1%></a>
            <%--                <a href="javascript:void(0)" onchange="test()"><%=j+1%></a>--%>
            <%
                }
            %>
            <%
                }
            %>
<%--            <a class="next page-numbers" href="javascript:;">next</a>--%>
        </div>
    </div>
</div>
