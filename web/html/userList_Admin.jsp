<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="DAO.UserDAO_Impl"%>
<%@ page import="DAO.UserDAO" %>
<%@ page import="database.ConnectDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UserList</title>
</head>
<body>
<table>
    <%
        ConnectDB connectDB = new ConnectDB();
        Connection conn = connectDB.connect();
        Statement stmt = conn.createStatement();
        
        UserDAO dao = new UserDAO_Impl();

    %>
</table>
</body>
</html>