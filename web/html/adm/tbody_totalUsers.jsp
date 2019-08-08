<%@ page import="pagination.Paging" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="UTF-8"%>
<tbody class="table_body">

<%

    int startIdx = paging.getStartIdx();
    int lastIdx = paging.getLastIdx();

    for(int j = startIdx-1; j<lastIdx;j++){
        if(j > userList.size()-1 )break;
        UserVO vo = userList.get(j);
%>
<tr>
    <td> <%=vo.getUuid()%></td>
    <td> <%=vo.getName()%></td>
    <td> <%=vo.getTell()%></td>
    <td style="text-decoration-line: underline">
        <a href="<%=router.admin.modify_userInfo%>?uuid=<%=vo.getUuid()%>">수정하기</a>
    </td>
</tr>
<%
    }
%>
</tbody>