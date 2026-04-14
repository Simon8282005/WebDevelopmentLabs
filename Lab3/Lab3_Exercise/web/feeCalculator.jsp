<%-- 
    Document   : feeCalculator
    Created on : Apr 14, 2026, 4:07:54 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculate Fee</title>
    </head>
    <body>
        <h1>Fee Calculator</h1>
        <form method="POST" name="feeCalculator">
            <label>Number of activities joined: </label>
            <input type="text" name="activity" placeholder="Num of activity joined..">

            <br /><br />
            <input type="submit" value="Calculate" />
            <input type="reset" value="Cancel" />

            <%
                String resultFormatted = "";

                if (request.getParameter("activity") != null) {
                    double result = Double.parseDouble(request.getParameter("activity")) * 10.0;
                    resultFormatted = String.format("Total fee = %.2f", result);
                }
            %>  
            <br /><br />
            <%= resultFormatted %>
        </form>
    </body>
</html>
