<%-- healthInfo.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>

<%!
    class BmiCategory {
        String category, range, description, advice;

        BmiCategory(String category, String range, String description, String advice) {
            this.category    = category;
            this.range       = range;
            this.description = description;
            this.advice      = advice;
        }
    }
%>

<%
    List<BmiCategory> categories = new ArrayList<BmiCategory>();

    categories.add(new BmiCategory(
        "Underweight", "BMI < 18.5",
        "Body weight is lower than what is considered healthy.",
        "Increase caloric intake with nutrient-rich foods. Consult a dietitian."
    ));
    categories.add(new BmiCategory(
        "Normal", "18.5 - 25.0",
        "Body weight is within the healthy range.",
        "Maintain a balanced diet and regular exercise routine."
    ));
    categories.add(new BmiCategory(
        "Overweight", "BMI > 25.0",
        "Body weight is higher than what is considered healthy.",
        "Adopt a calorie-controlled diet and increase physical activity."
    ));
%>

<div class="card">
    <div class="formContainer">
        <p class="formTitle">Health Information</p>

        <table border="1" cellpadding="8" cellspacing="0">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>BMI Range</th>
                    <th>Description</th>
                    <th>Advice</th>
                </tr>
            </thead>
            <tbody>
                <% for (BmiCategory cat : categories) { %>
                <tr>
                    <td><%= cat.category %></td>
                    <td><%= cat.range %></td>
                    <td><%= cat.description %></td>
                    <td><%= cat.advice %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <p>
            <a href="bmiCalculator.jsp">Calculate My BMI</a>
        </p>
    </div>
</div>

<%@ include file="footer.jsp" %>
