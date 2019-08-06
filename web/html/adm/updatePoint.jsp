<%@ page import="Util.PointUpdateTransaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PointUpdateTransaction pu = new PointUpdateTransaction();
    pu.updatePoint(request,response);
%>
<html>
<head>
    <title>updatePoint</title>
</head>
<body>

</body>
</html>
