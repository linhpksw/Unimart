<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:set var="errorMessage" value="${requestScope.errorMessage}"/>

<html>
    <head>
        <title>Forgot Password</title>
        <link rel="stylesheet" href="./static/css/tailwind.css"/>
        <style>
            <%@include file="./static/css/tailwind.css" %>
        </style>
    </head>
    <body>
        <h2>Forgot Password</h2>
        <c:if test="${not empty errorMessage}">
            <p>Status: ${errorMessage}</p>
        </c:if>
        <form action="forgot" method="post">
            <label for="credential">Username, Email, or Phone:</label>
            <input type="text" id="credential" name="credential" required>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
