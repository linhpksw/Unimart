<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>
        <link rel="stylesheet" href="../static/css/tailwind.css"/>
        <style>
            <%@include file="../static/css/tailwind.css" %>
        </style>
    </head>
    <body>
        <h2>Reset Password</h2>
        <%-- Display any error messages --%>
        <c:if test="${not empty errorMessage}">
            <p>Error: ${errorMessage}</p>
        </c:if>
        <form action="${pageContext.request.contextPath}/reset" method="post">
            <%-- Pass the token back to the server --%>
            <input type="hidden" name="token" value="${token}"/>
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <button type="submit">Reset Password</button>
        </form>
    </body>
</html>
