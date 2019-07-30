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
    <tr>
        <td>번호</td>
        <td>이름</td>
        <td>연락처</td>
        <td>수정</td>
    </tr>
    <%
        ConnectDB connectDB = new ConnectDB();
        Connection conn = connectDB.connect();
        Statement stmt = conn.createStatement();

        UserDAO dao = new UserDAO_Impl();
        connectDB.disConnect(conn);

    %>
</table>
</body>
</html>