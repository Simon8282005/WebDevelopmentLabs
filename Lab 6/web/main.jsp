<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome page</title>
    </head>
    
    <%
        String username = request.getParameter("name");
    %>
    <body>
        <h1>Welcome !! <%= username %></h1>
        <p>Nice to meet u ~</p>
        <button onclick="window.location.href='insertUser.jsp'">Insert new user</button>
        <button onclick="window.location.href='login.jsp'">Login to another account</button>
    </body>
</html>
