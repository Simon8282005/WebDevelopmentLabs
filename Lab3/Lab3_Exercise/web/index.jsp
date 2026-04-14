<%-- 
    Document   : main
    Created on : Apr 14, 2026, 4:06:51 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        body {
            background-color: #F8FAFC;
        }
        
        nav {
            text-align: center;
            margin: 5px;
            background-color: #1E293B;
            padding: 10px;
        }
        
        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 10px 10px 10px;
        }
        
        nav a:hover {
            color: #94A3B8;
            text-decoration: underline;
        }
        
        .title {
            text-align: center;
            color: #1E293B;
        }
        
        .content {
            text-align: center;
            color: #64748B;
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
        
        <br />
        <h3 class="title">Welcome to the Student Club Recruitment Website !</h3>
        <p class="content">You can use the navigation bar to access different page of website. Feel free to explore the website !</p>
        <jsp:include page="footer.jsp" />
    
</html>
