<%-- 
    Document   : task1
    Created on : Apr 29, 2026, 3:10:46 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 1: Scriptlet & Bean</title>
    </head>
    <body>
        <h2>Student Information (Using Scriptlet)</h2>
        <%
            // INstantiating the bean
            StudentBean student = new StudentBean();
            student.setName("Simon");
            student.setMatricNo("S76136");
        %>
        <p><strong>Name: </strong><%= student.getName()%></p>
        <p><strong>Matric No: </strong><%= student.getMatricNo()%></p>
    </body>
</html>
