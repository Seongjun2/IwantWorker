<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding ="EUC-KR"%>
<tbody align="center" class = "tbody_list">

<%
    UserDAO userDao = new UserDAO_Impl();
    List<UserVO> userList = userDao.getSearchInfo(searchName);

    int i = ((pageNum-1) * 10)+1;
    int lastIdx = 0;
    int startIdx = i-1;

    if(pageNum == lastPageNum) lastIdx = userList.size();
    else{
        lastIdx = startIdx+10;
    }

    for(int j = startIdx; j<lastIdx;j++){
        if(j > userList.size()-1 )break;
        UserVO vo = userList.get(j);
%>
<tr>
    <td> <%=i%></td>
    <td> <%=vo.getName()%></td>
    <td> <%=vo.getTell()%></td>
    <td>
        <a href="<%=router.admin.modify_userInfo%>?uuid=<%=vo.getUuid()%>">수정하기</a>
    </td>
</tr>
<%
        i++;
    }
%>
</tbody>