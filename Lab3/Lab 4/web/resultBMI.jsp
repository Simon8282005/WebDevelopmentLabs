<%-- resultBMI.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<%
    String bmiParam    = request.getParameter("bmi");
    String category    = request.getParameter("category");
    String weightParam = request.getParameter("weight");
    String heightParam = request.getParameter("height");

    double bmi    = (bmiParam    != null) ? Double.parseDouble(bmiParam)    : 0.0;
    double weight = (weightParam != null) ? Double.parseDouble(weightParam) : 0.0;
    double height = (heightParam != null) ? Double.parseDouble(heightParam) : 0.0;

    String bmiFormatted = String.format("%.2f", bmi);
%>

<div class="card">
    <div class="formContainer">
        <p class="formTitle">Your BMI Result</p>

        <p>BMI Value : <%= bmiFormatted %></p>
        <p>Category  : <%= category != null ? category : "N/A" %></p>
        <p>Weight    : <%= String.format("%.1f", weight) %> kg</p>
        <p>Height    : <%= String.format("%.2f", height) %> m</p>

        <p>
            <input type="button" value="Calculate Again" onclick="history.back()" />
            <a href="healthInfo.jsp">Health Info</a>
        </p>
    </div>
</div>

<%@ include file="footer.jsp" %>
