<%-- 
    Document   : registerStudent
    Created on : May 24, 2026, 11:50:24 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hello</title>
    </head>
    <body>
        <h1>Can register here...</h1>
        <form action="registerServlet" method="POST">
            <label>Name: </label>
            <input type="text" name="name" required><br/><br/>
            <label>Subject: </label>
            <select name="subjectList">
                <option>Web Development</option>
                <option>Software Testing</option>
                <option>Database Design</option>
            </select><br/><br/>
            <label>Mark: </label>
            <input type="number" name="mark" required><br/><br/>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
