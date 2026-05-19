<%-- 
    Document   : dashboard
    Created on : May 19, 2026, 3:15:58 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dashboard</title>
    </head>
    <body>
        
        <%  
            HttpSession ses = request.getSession(true);
            ses.setAttribute("matricNo", request.getParameter("matricNo"));
        %>
        
        <h1>Welcome ! Please choose action below..</h1>
        <a href="${pageContext.request.contextPath}/subject/registerSubject.jsp?action=registerSubject">Register new subject..</a><br/>
        
        <a href="${pageContext.request.contextPath}/subject/viewSubject.jsp?action=viewSubject">View subject..</a><br/>
    </body>
</html>
