<%-- processBMI.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /* ── Retrieve parameters ── */
    String weightParam = request.getParameter("weight");
    String heightParam = request.getParameter("height");

    double weight = 0.0;
    double height = 0.0;
    double bmi = 0.0;
    String category = "";

    /* ── Validation: check numeric ── */
    try {
        weight = Double.parseDouble(weightParam);
        height = Double.parseDouble(heightParam);
    } catch (NumberFormatException e) {
        response.sendRedirect("bmiCalculator.jsp?error=invalid");
        return;
    }

    /* ── Validation: height must not be zero ── */
    if (height == 0) {
        response.sendRedirect("bmiCalculator.jsp?error=zero");
        return;
    }

    /* ── Calculate BMI ── */
    bmi = weight / (height * height);

    /* ── Determine category ── */
    if (bmi < 18.5) {
        category = "Underweight";
    } else if (bmi <= 25) {
        category = "Normal";
    } else {
        category = "Overweight";
    }
%>

<%-- Forward result to resultBMI.jsp with params --%>
<jsp:forward page="resultBMI.jsp">
    <jsp:param name="bmi"      value="<%= bmi%>"      />
    <jsp:param name="category" value="<%= category%>" />
    <jsp:param name="weight"   value="<%= weight%>"   />
    <jsp:param name="height"   value="<%= height%>"   />
</jsp:forward>
