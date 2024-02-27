<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="status" value="${requestScope.status}"/>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Confirm Reset</title>
    </head>
    <body>
        <h2>Password Reset Email Sent</h2>
        <p>Please check your email for the password reset link. The link will expire in 10 minutes.</p>
    </body>
</html>
