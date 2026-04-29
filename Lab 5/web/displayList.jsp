<%-- 
    Document   : displayList
    Created on : Apr 29, 2026, 3:54:43 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1" cellpadding="8">
            <tr style="background-color: lightgray">
                <th>No. </th>
                <th>Name</th>
                <th>Metric Number</th>
            </tr>
            <c:forEach items="${studentList}" var="student" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${student.name}</td>
                    <td>${student.matricNo}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
