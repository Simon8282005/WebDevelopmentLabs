<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Currency Conversion</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Use JSP Declaration Tag. JSP Scriplet and <br/> JSP Expression in Application</h1>
        <div class="card">
            <div class="formContainer">
                <form action="processCurrency.jsp" method="POST">
                    <label class="formTitle">Currency Conversion</label><br/><br/>

                    <label class="formLabel">Amount(RM): </label><br/>
                    <input type="number" name="amount" placeholder="Enter amount..."><br/><br/>

                    <label class="formLabel">Convert to: </label><br/>
                    <select name="currencyType">
                        <option value="1">USD</option>
                        <option value="2">EURO</option>
                        <option value="3">JPY</option>
                        <option value="4">SGD</option>
                    </select><br/><br/>
                    
                    <input type="submit" value="Convert">
                </form>
            </div>
        </div>
    </body>
</html>
