<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Subject Information</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Using jsp:include and jsp:param to display information</h1>
        <div class="card">
            <div class="formContainer">
                <label class="formTitle">Calling SubjectInfo.jsp Page</label><br/>
                
                <p>Code: <%= request.getParameter("code")%></p>
                <p>Subject: <%= request.getParameter("subject")%></p>
                <p>Credit: <%= request.getParameter("credit")%></p>
            </div>
        </div>
    </body>
</html>