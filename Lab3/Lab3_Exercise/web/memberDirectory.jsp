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
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background-color: #1E293B;
            color: #F8FAFC;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 40px 20px;
            font-family: sans-serif;
        }

        h1 {
            font-size: 24px;
            font-weight: 500;
            margin-bottom: 24px;
            color: #F8FAFC;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 700px;
            background-color: #334155;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background-color: #6366F1;
            color: #fff;
            padding: 10px 16px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 9px 16px;
            font-size: 13px;
            color: #F8FAFC;
            border-bottom: 0.5px solid #475569;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background-color: #3B4F68;
        }

        .empty-msg {
            margin-top: 20px;
            color: #94A3B8;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <h1>Student List</h1>

    <%
        ArrayList<Student> studentList = (ArrayList<Student>) session.getAttribute("studentList");
        if (studentList != null && !studentList.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Student Name</th>
            <th>Matric Number</th>
            <th>Club</th>
        </tr>
        <% for (Student s : studentList) { %>
        <tr>
            <td><%= s.getName() %></td>
            <td><%= s.getMatricNum() %></td>
            <td><%= s.getClub() %></td>
        </tr>
        <% } %>
    </table>
    <% } else { %>
        <p class="empty-msg">No students found.</p>
    <% } %>

</body>
</html>
