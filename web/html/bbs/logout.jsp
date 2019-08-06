<%
    session.removeAttribute("uuid");
    session.removeAttribute("user_level");
    response.sendRedirect(request.getContextPath()+"/html/index.jsp");
%>