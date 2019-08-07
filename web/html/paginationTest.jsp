<%@ page import="pagination.Paging" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%

%>

<link rel="stylesheet" type="text/css", href="../css/pagination.css">
<div class="pagination-wrapper" onchange="test()">
    <div class="pagination">
        <div>
            <a class="prev page-numbers" href="javascript:;">prev</a>
            <%
                for(int j = 0; j<lastPageNum;j++){
                if(pageNum == j+1){%>
                    <span aria-current="page" class="page-numbers current"><%=j+1%></span>
            <%
                }
                else{%>
                <a class="page-numbers" href="userList_Admin.jsp?pageNum=<%=j+1%>"><%=j+1%></a>
                <%
                }
            %>
            <%
                }
            %>
            <%--<a class="page-numbers" href="javascript:;">7</a>--%>
            <%--<a class="page-numbers" href="javascript:;">8</a>--%>
            <%--<a class="page-numbers" href="javascript:;">9</a>--%>
            <%--<a class="page-numbers" href="javascript:;">10</a>--%>
            <a class="next page-numbers" href="javascript:;">next</a>
        </div>
    </div>
</div>
