<%-- 
    Document   : viewSubject
    Created on : May 19, 2026, 3:16:46 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.lab.bean.subjectBean"%>
<%@page import="com.lab.dao.subjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Subject List</h1>
        
        <%
            subjectDAO subDAO = new subjectDAO();
            ArrayList<subjectBean> subjectList = subDAO.viewSubject();
            
            // Get matricNo
            String matricNo = (String) session.getAttribute("matricNo");
        %>
        
        <p>Matric No: <%= matricNo %></p>
        
        <%
            for (int i = 0; i < subjectList.size(); i++) {
        %>
        
        <p>Subject Name: <%= subjectList.get(i).getSubjectName() %></p>
        <p>Subject Code: <%= subjectList.get(i).getSubjectCode() %></p>
        <a href="updateSubject.jsp?subjectCode=<%= subjectList.get(i).getSubjectCode() %>">Update subject</a>
        
        <%
            }
        %>
        <br/>
        <a href="../dashboard.jsp">Back to Dahsboard</a>
    </body>
</html>
