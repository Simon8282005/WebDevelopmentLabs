<%-- bmiCalculator.jsp --%>
<%@ include file="header.jsp" %>

<div class="card">
    <div class="formContainer">
        <p class="formTitle">BMI Calculator</p>

        <%-- Display validation error if any --%>
        <% String error = request.getParameter("error");
            if (error != null) { %>
        <p style="color: red;">
            <% if (error.equals("invalid")) { %>
            Invalid input. Please enter numeric values only.
            <% } else if (error.equals("zero")) { %>
            Height cannot be zero. Please enter a valid height.
            <% } %>
        </p>
        <% }%>

        <form action="processBMI.jsp" method="post">
            <p>
                <label for="weight">Weight (kg):</label>
                <input type="number" id="weight" name="weight"
                       placeholder="e.g. 65" step="0.1" min="1" required />
            </p>

            <p>
                <label for="height">Height (m):</label>
                <input type="number" id="height" name="height"
                       placeholder="e.g. 1.70" step="0.01" min="0.01" required />
            </p>

            <p>
                <input type="submit" value="Calculate BMI" />
                <input type="reset"  value="Clear" />
            </p>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>
