<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<tbody align="center" class = "tbody_list">

<%
    for(int j = startIdx; j<lastIdx;j++){
        if(userList.size() == 0)break;
        UserVO vo = userList.get(j);
%>
<tr>
    <td> <%=i%></td>
    <td> <%=vo.getName()%></td>
    <td> <%=vo.getTell()%></td>
    <td>
        <a href="<%=router.admin.modify_userInfo%>?uuid=<%=vo.getUuid()%>">�����ϱ�</a>
    </td>
</tr>
<%
        i++;
    }
%>
</tbody>