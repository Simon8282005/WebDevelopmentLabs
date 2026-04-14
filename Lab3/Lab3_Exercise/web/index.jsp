<%-- 
    Document   : main
    Created on : Apr 14, 2026, 4:06:51 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        nav {
            text-align: center;
            margin: 5px;
        }
        
        nav a {
            color: black;
            text-decoration: none;
            padding: 10px 10px 10px 10px;
        }
        
        nav a:hover {
            color: grey;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Club Recruitment </title>
    </head>
        <!-- Show header and footer -->
        <jsp:include page="header.jsp" />            
        <nav>
            <a href="registerClub.jsp">Register</a>
            <a href="feeCalculator.jsp">Fee Calculator</a>
            <a href="memberDirectory.jsp">Club member Directory</a>
        </nav>
        
        <p>Welcome to the Student Club Recruitment Website !</p>
        <jsp:include page="footer.jsp" />
    
</html>
