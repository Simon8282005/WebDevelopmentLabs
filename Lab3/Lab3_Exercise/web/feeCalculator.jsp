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
    <style>
        body {
            background-color: #1E293B;
            color: #F8FAFC;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        fields {
            display: block;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        input {
            background-color: #334155;
            color: #F8FAFC;
            font-size: 14px;
            border: none;
            outline: none;
            display: block;
            left: 50%;
            height: 34px;
            vertical-align: middle;
            border-radius: 22px;
            width: 220px;
            box-sizing: border-box;
            padding-right: 10px;
            padding-left: 10px;
        }

        input::placeholder {
            color: #94A3B8;
        }

        inputs:focus {
           outline: 2px solid #6366F1;
        }

        .submit {
            color: white;
            border-radius: 22px;
            min-height: 30px;
            padding: 5px;
            background-color: #6366F1;
            padding-left: 10px;
            padding-right: 10px;

        }

        .submit:hover {
            outline: 1px solid white;
        }

        .cancel {
            color: white;
            border-radius: 22px;
            min-height: 30px;
            padding-left: 10px;
            padding-right: 10px;
        }

        .cancel:hover {
            outline: 1px solid white;
        }
    </style>
    <body>
        <form method="POST" name="feeCalculator">
            <h1>Fee Calculator</h1>
            <label>Number of activities joined: </label><br /><br />
            <input type="text" name="activity" placeholder="Num of activity joined..">

            <br /><br />
            <input class="submit" type="submit" value="Calculate" />
            <br />
            <input class="cancel" type="reset" value="Cancel" />

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
