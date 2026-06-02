<%-- 
    Document   : viewStudentList
    Created on : May 24, 2026, 11:42:50 AM
    Author     : simon
--%>

<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Student List</title>
    </head>
    <body>
        <%
            ArrayList<Student> studentList = new ArrayList<>();

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");

                String SQL = "SELECT * FROM mini_project_student";
                PreparedStatement ps = conn.prepareStatement(SQL);

                ResultSet rs = ps.executeQuery();

                System.out.println("Insert new student record successfully. ");

                response.sendRedirect("viewStudentList.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
            </tr>

            <c:forEach var="student" items="${studentList}">
                <tr>
                    <td>${student.name}</td>
                    <td>${student.subject}</td>
                    <td>${student.mark}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
