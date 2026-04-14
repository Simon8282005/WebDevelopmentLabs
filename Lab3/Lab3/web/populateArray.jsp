<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Populate Array   </title>
    </head>
    <body>
        <%
            String[] salesman = {"Salesman1", "Salesman2", "Salesman3"};
            int[] jan_sale = {2500, 2000, 1800};
            int[] feb_sale = {2100, 1900, 2200};
            int[] march_sale = {2200, 2400, 2450};
            
            // Java 2d array
            String[][] hello = {
                {"Simon", "Syamil"}, {"Computer", "Games"}
            };
        %>
        
        <style>
            td, th {
                border: 0px solid #dddddd;
                text-align: center;
                padding: 8px;
            }
            
            th {
                background-color: #E3CA81;
            }
            
            tr:nth-child(even) {
                background-color: #F5F1E7;
            }
        </style>
        
        <table>
            <tr>
                <th>Salesman</th>
                <th>Jan</th>
                <th>Feb</th>
                <th>Mac</th>
            </tr>
            <tr>
                <td><%= salesman[0] %></td>
                <td><%= jan_sale[0] %></td>
                <td><%= feb_sale[0] %></td>
                <td><%= march_sale[0] %></td>
            </tr>
            <tr>
                <td><%= salesman[1] %></td>
                <td><%= jan_sale[1] %></td>
                <td><%= feb_sale[1] %></td>
                <td><%= march_sale[1] %></td>
            </tr>
            <tr>
                <td><%= salesman[2] %></td>
                <td><%= jan_sale[2] %></td>
                <td><%= feb_sale[2] %></td>
                <td><%= march_sale[2] %></td>
            </tr>
        </table>
    </body>
    <br />
    &copy;2026-Simon
</html>
