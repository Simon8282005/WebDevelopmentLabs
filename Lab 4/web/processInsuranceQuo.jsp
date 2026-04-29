<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurans Process</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f7f6;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .card {
                display: flex;
                flex-direction: column;
                border: 1px solid #ccc;
                box-shadow: 0 0px 0px rgba(0, 0, 0, 0);
                transition: box-shadow 0.3s ease-in;
                padding: 20px;
                min-width: 30vw;
            }

            .card:hover {
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
            }

            .formContainer {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .formContainer .formTitle {
                font-size: 16px;
                font-weight: 700;
                color: grey;
            }

            .formContainer p {
                display: block;
            }

            .formBorder {
                border: 1px solid grey;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <%
            // Retrieve form data
            String icno = request.getParameter("ic");
            String name = request.getParameter("name");
            String coverage = request.getParameter("coverage");
            String ncdStr = request.getParameter("ncd");
            
            double price = 0;
            double ncd = 0;
            
            try {
                price = Double.parseDouble(request.getParameter("price"));
                ncd = Double.parseDouble(ncdStr);
            } catch (Exception e) {
                price = 0;
                ncd = 0;
            }

            // Business Logic
            double rate = 0;
            String coverageDisplay = "";

            if ("comprehensive".equals(coverage)) {
                rate = 0.05; // 5%
                coverageDisplay = "Comprehensive";
            } else {
                rate = 0.03; // 3%
                coverageDisplay = "Third Party";
            }

            // Base insurance calculation
            double insurance = price * rate;

            // Apply NCD discount
            double discount = insurance * ncd;
            double afterNCD = insurance - discount;

            // Add 8% SST
            double sst = afterNCD * 0.08;
            double finalAmount = afterNCD + sst;
        %>
        <h1>Insurance Quotation Result</h1>
        <div class="card">
            <div class="formContainer">
                <label class="formTitle">IC No: </label><br/>
                <%= icno%><br/><br/>

                <label class="formTitle">Name: </label><br/>
                <%= name%><br/><br/>

                <label class="formTitle">Market Price (RM): </label><br/>
                <%= coverageDisplay%><br/><br/>

                <label class="formTitle">Base Insurance: </label><br/>
                <%= String.format("%.2f", price)%><br/><br/>

                <label class="formTitle">Base Insurance: </label><br/>
                <%= String.format("%.2f", discount)%><br/><br/>

                <label class="formTitle">After NCD: </label><br/>
                <%= String.format("%.2f", afterNCD)%><br/><br/>

                <label class="formTitle">SST (8%): </label><br/>
                <%= String.format("%.2f", sst)%><br/><br/>

                <label class="formTitle">Final Insurance Amount: </label><br/>
                <strong><%= String.format("%.2f", finalAmount)%></strong>
            </div>
        </div>
    </body>
</html>
