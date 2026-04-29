<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>

        <%
            // Fixed price
            final double price = 10.0;

            // Retrieve form data
            String customerCode = request.getParameter("customerCode");
            String customerType = request.getParameter("customerType");

            int quantity = 0;

            try {
                quantity = Integer.parseInt(request.getParameter("customerQuantity"));
            } catch (Exception e) {
                System.out.println("Fetching quantity errror...default set to 0. Error in " + e.getMessage());
                quantity = 0;
            }

            // Business logic
            double total = 0;
            String message = "";

            if (customerType.equals("1") && quantity > 100) {
                message = "You're entitled to 10% discount";
                total = quantity * price * 0.9;
            } else if (customerType.equals("2") && quantity > 100) {
                message = "You're entitled to 25% discount";
                total = quantity * price * 0.75;
            } else {
                message = "You're not entitled to any discount";
                total = quantity * price;
            }
            
            String totalText = String.format("%.2f", total);
            
            // Display customer type
            String customerTypeText = customerType.equals("1") ? "Normal Customer" : "Privilage Customer";
        %>
        <h1>Customer Discount Result</h1>
        <div class="card">
            <div class="formContainer">
                <form action="processCustomer.jsp" method="POST">
                    <label class="formTitle">Transaction Summary</label><br/><br/>

                    <label class="formLabel">Customer Code: </label><br/>
                    <%= customerCode %><br/><br/>

                    <label class="formLabel">Quanlity: ${quantity} </label><br/>
                    <%= quantity %><br/><br/>

                    <label class="formLabel">Customer Type: </label><br/>
                    <%= customerTypeText %><br/><br/>

                    <label class="formLabel">Status:</label><br/>
                    <%= message %> <br/><br/>
                    
                    <label class="formLabel">Total Amount: </label><br/>
                    RM <%= totalText %>
                </form>
            </div>
        </div>
    </body>
</html>
