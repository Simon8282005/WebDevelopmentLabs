<%-- 
    Document   : updateSubject
    Created on : May 19, 2026, 3:16:40 PM
    Author     : user
--%>

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
        <h1>Update Subject</h1>
        <%
            String subjectCode = request.getParameter("subjectCode");
            subjectDAO subDAO = new subjectDAO();
            
            subjectBean subject = subDAO.viewSubjectBySubjectCode(subjectCode);
        %>
        
        <form method="POST" action="${pageContext.request.contextPath}/subjectServlet?action=updateSubject">

            <label>New Subject Name: </label>
            <input type="text" name="subjectName" maxlength=30 value="<%= subject.getSubjectName() %>" required><br /><br />

            <label>New Subject Code: </label>
            <input type="text" name="subjectCode" maxlength=7 value="<%= subject.getSubjectCode() %>" required><br /><br />

            <input type="submit" value="update">
            
        </form>
    </body>
</html>
