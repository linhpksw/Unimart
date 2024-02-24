<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="errorMessage" value="${requestScope.errorMessage}"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <h1>Login Page</h1>
        <form action="login" method="post">
            <div>
                <label for="credential">Username or Phone or Email:</label>
                <input type="text" id="credential" name="credential" placeholder="Username or Phone or Email" required/>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Password" required/>
            </div>
            <div>
                <label for="rememberMe">Remember Me:</label>
                <input type="checkbox" id="rememberMe" name="rememberMe"/>
            </div>
            <div>
                <input type="submit" value="Login"/>
            </div>
            <div>
                <a href="signup">Register</a>
            </div>
            <div>
                <c:if test="${not empty errorMessage}">
                    <p style="color: red">${errorMessage}</p>
                </c:if>
            </div>
        </form>
    </body>
</html>
