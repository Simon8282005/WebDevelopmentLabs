<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login first..</h1>

        <form action="doLogin.jsp" method="POST">
            <label>Username: </label>
            <input type="text" name="name" placeholder="Your username.." maxlength="15" required><br/><br/>
            <label>Password: </label>
            <input type="password" name="password" maxlength="10" required><br/><br/>

            <input type="submit" value="Login"/><br/><br/>

            <p id="errorMessage" style="display: none; margin-bottom: 0px; margin-top: 0px; color: red;">Password or username are wrong...pls double check</p>
        </form>

        <script>
            const params = new URLSearchParams(window.location.search);
            var errorMessage = document.getElementById("errorMessage");

            if (params.get("error") === "1") {
                errorMessage.style.display = "block";
                errorMessage.style.marginTop = "10px";
                errorMessage.style.marginBottom = "10px";
            }
        </script>
    </body>
</html>
