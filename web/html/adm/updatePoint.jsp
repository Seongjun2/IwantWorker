<%@ page import="DAO.UserDAO" %>
<%@ page import="DAO.UserDAO_Impl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String status = request.getParameter("status");
    UserDAO userDAO = new UserDAO_Impl();

    if(status.equals("Success")){
        userDAO.update();
    }
    else if(status.equals("Expire")){

    }
%>
<html>
<head>
    <title>updatePoint</title>
</head>
<body>

</body>
</html>
