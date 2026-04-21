<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forward Info</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
            String name = request.getParameter("uname");
            String email = request.getParameter("email");
            String nationality = request.getParameter("nationality");
            String background = request.getParameter("background");
        %>


        <h1>Using jsp:include and jsp:param to display information</h1>
        <div class="card">
            <div class="formContainer">
                <label class="formTitle">Calling SubjectInfo.jsp Page</label><br/>
                
                <p>Name: <%= name%></p>
                <p>Email: <%= email%></p>
                <p>Nationality: <%= nationality%></p>
                <p>Background: <%= background%></p>
            </div>
        </div>
    </body>
</html>
