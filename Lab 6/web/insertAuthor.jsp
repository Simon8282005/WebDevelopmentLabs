<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Author Info</h3>
        <form action="processAuthor.jsp">
            <label>Auth No: </label>
            <input type="text" name="id" maxlenght="15" required=""><br/><br/>
            <label>Name: </label>
            <input type="text" name="name" maxlenght="50" required=""><br/><br/>
            <label>Address: </label>
            <input type="text" name="address" maxlenght="40" required=""><br/><br/>
            <label>City: </label>
            <input type="text" name="city" maxlenght="40" required=""><br/><br/>
            <label>State </label>
            <input type="text" name="state" maxlenght="40" required=""><br/><br/>
            <label>Zip: </label>
            <input type="text" name="zip" maxlenght="40" required=""><br/><br/>
            
            <input type="submit" value="Create new author record">
        </form>
    </body> 
</html>
