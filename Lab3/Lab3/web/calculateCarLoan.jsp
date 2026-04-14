<%-- 
    Document   : calculateCarLoan
    Created on : Apr 14, 2026, 2:39:56 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- interest = 0.045 -->
        <h1>Perform Car Loan Calculation</h1>
        <form method="get" name="carLoan">
            <label>Loan Calculation</label>
            <br /><br />
            <label>Loan Amount* </label>
            <input type="text" id="amount" name="amount" placeholder="Amount">
            <br />
            <label>Period</label>
            <select name="option" size="1">
                <option value="3">3 years</option>
                <option value="4">4 years</option>
                <option value="5">5 years</option>
                <option value="6">6 years</option>
                <option value="7">7 years</option>
            </select>
            <br/><br/>
            <input type="submit" value="Calculated">
            <input type="reset" value="Cancel">
        </form>
        
        <%
            double interest = 0.045f;
            double result = 0.0f;
            double period = 0.0;
            
            if (request.getParameter("amount") != null) {
                double amount = Double.parseDouble(request.getParameter("amount"));
                String periodText = request.getParameter("option");
                
                switch(periodText) {
                    case "3": period = 3.0; break;
                    case "4": period = 4.0; break;
                    case "5": period = 5.0; break;
                    case "6": period = 6.0; break;
                    case "7": period = 7.0; break;
                }
                
                result = amount + (amount * interest * period);
                
            }
            
            String resultText = String.format("%.2f", result);
        %>
    </body>
    
    Result = <%= resultText %>
</html>
