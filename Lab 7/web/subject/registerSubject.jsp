<%-- 
    Document   : registerSubject
    Created on : May 19, 2026, 3:16:32 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register new subject</title>
    </head>
    <body>
        <h1>Please fill in form below..</h1>
        <form method="POST" action="${pageContext.request.contextPath}/subjectServlet?action=registerSubject">
            <label>Subject Name: </label>
            <input type="text" name="subjectName" maxlength=30 required><br /><br />
            
            <label>Subject Code: </label>
            <input type="text" name="subjectCode" maxlength=7 required><br /><br />
            
            <input type="submit" value="submit">
        </form>
    </body>
</html>
