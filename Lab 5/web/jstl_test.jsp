<%-- 
    Document   : jstl_test
    Created on : Apr 29, 2026, 3:37:35 PM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="now" class="java.util.Date" />
        
        <p>1. Date only(Default)
            <strong>
                <fmt:formatDate value="${now}" type="date" />
            </strong>
        </p>

        <p>2. Time only(Default)
            <strong>
                <fmt:formatDate value="${now}" type="time" />
            </strong>
        </p>

        <p>3. Both Date & Time:
            <strong>
                <fmt:formatDate value="${now}" type="both" />
            </strong>
        </p>

        <p>4. Long Date & Short Time:
            <strong>
                <fmt:formatDate value="${now}" type="both" dateStyle="long" timeStyle="short" />
            </strong>
        </p>

        <p>5. Custom Pattern (dd MM yyyy, hh:mm a):
            <strong>
                <fmt:formatDate value="${now}" type="both" pattern="dd MM yyyy, hh:mm a" />
            </strong>
        </p>


        <h2>JSTL Conditional Test</h2>
        
        <c:set var="score" value="85" />
        
        <p>Student Score: <c:out value="${score}" /></p>

        <c:if test="${score >= 50}">
            <p style="color:green; "><strong>Status: Pass ! Congratulation. </strong></p>
        </c:if>

        <c:if test="${score <= 50}">
            <p style="color:red; "><strong>Status: Sorry...u did not make it </strong></p>
        </c:if>
    </body>
</html>
