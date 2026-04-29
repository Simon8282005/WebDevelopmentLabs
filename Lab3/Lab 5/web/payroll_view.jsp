<%-- 
    Document   : payroll_view
    Created on : Apr 29, 2026, 2:20:12 PM
    Author     : Simon
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Employee Information</title>
    </head>
    <body>
        <h1>Hello Guest !</h1>
        <table>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Basic Salary</th>
            <th>Status</th>
            <tbody>
            <!-- use the variable directly -->
            <c:forEach items="${employeelist}" var="employee" varStatus="status">
                <tr>
                    <td>${employee.empID}</td>
                    <td>${employee.name}</td>
                    <td>${employee.department}</td>
                    <td>${employee.basicSalary}</td>
                    <td>
                        <c:choose>
                            <c:when test="${employee.basicSalary >= 3000.0}">
                                Senior
                            </c:when>
                            <c:otherwise>
                                Junior
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
