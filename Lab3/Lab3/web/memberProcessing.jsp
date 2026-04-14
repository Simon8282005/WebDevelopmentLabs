<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 3 - Task 1</title>
    </head>
    <body>
        <h2>Passing data from main JSP page to another JSP page.</h2>

        <filedset>
        <%
            // Define variables
            String myIc = null;
            String myName = null;
            
            // User request.getParameter() to get data from 
            // the form
            myIc = request.getParameter("my_icno");
            myName = request.getParameter("my_name");
        %>
        
        <p>Thank you for registering in this event...!</p>
        <p>This is your details: </p>
        <p>IC No: <%= myIc %> </p>
        <p>Name: <%= myName %></p>
        </filedset>
    </body>
</html>
