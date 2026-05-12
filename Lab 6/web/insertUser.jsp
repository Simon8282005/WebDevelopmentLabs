<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>User Info</h3>
        <form action="processUser.jsp">
            <label>Username: </label>
            <input type="text" name="name" maxlenght="15" placeholder="Your Username..." required=""><br/><br/>
            <label>Password: </label>
            <input type="password" name="password" maxlenght="10" required=""><br/><br/>
            <label>First Name: </label>
            <input type="text" name="firstname" maxlenght="50" placeholder="Your first name..." required=""><br/><br/>
            <label>Last Name: </label>
            <input type="text" name="lastname" maxlenght="50" placeholder="Your last name..." required=""><br/><br/>
            
            <input type="submit" value="Create new user account">
        </form>
    </body> 
</html>
