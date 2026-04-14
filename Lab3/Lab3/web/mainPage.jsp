<%-- 
    Document   : mainPage
    Created on : Apr 14, 2026, 3:34:54 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .content {
            color: red;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Inlcude Directive</title>
    </head>
        <jsp:include page="headerPage.jsp" />
        
        <h1>Using JSP Include directive</h1>
        <p class="content">Java Server Page (JSP) is a technology for controlling the content <br />
or appearance of Web pages through the use of servlets, small <br />
programs that are specified in the Web page and run on the Web server <br />
to modify the Web page before it is sent to the user who requested it.</p>
        
        <jsp:include page="footerPage.jsp" />
    </body>
</html>
