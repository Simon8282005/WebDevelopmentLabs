<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Convert Result</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <!-- Declaration syntax in JSP -->
        <%!
            final double USD = 0.25;
            final double EURO = 0.21;
            final double JPY = 40;
            final double SGD = 0.32;

            String targetCurrency = "";
            double total = 0.0;

            public double calculateRate(String currencyType, double amount) {
                switch (currencyType) {
                    case "1":
                        total = amount * USD;
                        targetCurrency = "USD";
                        break;
                    case "2":
                        total = amount * EURO;
                        targetCurrency = "EURO";
                        break;
                    case "3":
                        total = amount * JPY;
                        targetCurrency = "JPY";
                        break;
                    case "4":
                        total = amount * SGD;
                        targetCurrency = "SGD";
                        break;
                }
                
                System.out.println("Total: " + total);
                return total;
            }
        %>

        <!-- Sciriptlett in JSP -->
        <%
            double result = 0.0;
            double amount = 0.0;

            try {
                amount = Double.parseDouble(request.getParameter("amount"));
                result = calculateRate(request.getParameter("currencyType"), amount);
            } catch (Exception e) {
                System.out.println("Retreive data errorr..." + e.getMessage());
            }
        %>

        <div class="card">
            <div class="formContainer">
                <form action="processCustomer.jsp" method="POST">
                    <label class="formTitle">Convert Result.</label><br/><br/>

                    <label class="formLabel">Original Amount (RM): </label><br/>
                    <%= amount %><br/><br/>

                    <label class="formLabel">Converted Amount (RM to <%= targetCurrency %>): </label><br/>
                    <%= result %><br/><br/>

                    <input type="button" value="back" onclick="history.back()" />
                </form>
            </div>
        </div>
    </body>
</html>
