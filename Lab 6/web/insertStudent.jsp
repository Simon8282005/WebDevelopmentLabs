<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Student Info</h3>
        <form action="processStudent.jsp">
            <label>Id: </label>
            <input type="text" name="id" maxlenght="15" placeholder="Your ID..." required=""><br/><br/>
            <label>Name: </label>
            <input type="text" name="name" maxlenght="50" placeholder="Your name..." required=""><br/><br/>
            <label>Program: </label>
            <input type="text" name="program" maxlenght="40" placeholder="Your program..." required=""><br/><br/>
            <label>Address: </label>
            <input type="text" name="address" maxlenght="40" placeholder="Your address..." required=""><br/><br/>
            
            <input type="submit" value="Create new student record">
        </form>
    </body> 
</html>
