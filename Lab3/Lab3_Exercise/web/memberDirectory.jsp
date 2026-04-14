<%-- 
    Document   : memberDirectory
    Created on : Apr 14, 2026, 4:08:02 PM
    Author     : Simon
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.object.Student"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Club Member Directory</title>
    </head>
    <body>
        <h1>Student List</h1>
        <!-- for-loop in HTML -->
        <table border="1">
            <tr>
                <th>Student Name</th>
                <th>Matric Number</th>
                <th>Club</th>
            </tr>
           <%
                ArrayList<Student> studentList = (ArrayList<Student>) session.getAttribute("studentList");
                for (int i = 0 ; i < studentList.size(); i++) {
           %>
           
           <tr>
               <td><%= studentList.get(i).getName() %></td>
               <td><%= studentList.get(i).getMatricNum() %></td>
               <td><%= studentList.get(i).getClub() %></td>
           </tr>
           
           <% 
               } 
           %>
        </table>
    </body>
</html>
