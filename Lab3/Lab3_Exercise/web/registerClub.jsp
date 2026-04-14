<%-- 
    Document   : registerClub
    Created on : Apr 14, 2026, 4:07:24 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <h1>Please fill in you personal information....</h1>
        <form method="POST" action="processRegistration">
            <label>Name: </label>
            <input type="text" name="name" placeholder="Name.."><br /><br />
            
            <label>Matric Number: </label>
            <input type="text" name="matric" placeholder="Matic Number.."><br /><br />
            
            <label>Selected Club</label>
            <select name="club">
                <option value="COMTECH">COMTECH</option>
                <option value="XXR">XXR</option>
                <option value="Buddist">Buddist</option>
            </select><br /><br />
            
            <input type="submit" value="Register">
            <input type="reset" value="Cancel">
        </form>
    </body>
</html>
