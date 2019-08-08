<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<tbody align="center" class = "tbody_list">

<%
    int startIdx = paging.getStartIdx();
    int lastIdx = paging.getLastIdx();

    for(int j = startIdx; j<lastIdx;j++){
        if(j > userList.size()-1 )break;
        UserVO vo = userList.get(j);
%>
<tr>
    <td> <%=vo.getUuid()%></td>
    <td> <%=vo.getName()%></td>
    <td> <%=vo.getTell()%></td>
    <td>
        <a href="<%=router.admin.modify_userInfo%>?uuid=<%=vo.getUuid()%>">수정하기</a>
    </td>
</tr>
<
    }
%>
</tbody>