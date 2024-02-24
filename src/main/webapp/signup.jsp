<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="errorMessage" value="${requestScope.errorMessage}"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Signup</title>
    </head>
    <body>
        <h2>Signup</h2>
        <form action="signup" method="post">
            <div>
                <label for="id">Username:</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <button type="submit">Signup</button>
            </div>
            <div>
                <a href="login">Login</a>
            </div>
            <div>
                <c:if test="${not empty errorMessage}">
                    <p style="color: red">${errorMessage}</p>
                </c:if>
            </div>
        </form>
    </body>
</html>
