<%-- 
    Document   : jstl_database
    Created on : Apr 29, 2026, 4:08:06 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL SQL Tags</title>
    </head>
    <body>
        <h2>User List (Fetched diectly using JSTL SQL)</h2>

    <sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/webappdevlab5" user="root" password="admin" />
    <sql:query dataSource="${dbConnection}" var="result">
        SELECT * FROM users;
    </sql:query>

    <table>
        <tr style="background-color: lightblue;">
            <th>ID</th>
            <th>Username</th>
            <th>Roles</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><c:out value="${row.id}" /></td>
                <td><c:out value="${row.username}" /></td>
                <td><c:out value="${row.roles}" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
