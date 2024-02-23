<%--
  Created by IntelliJ IDEA.
  User: linhp
  Date: 1/20/2024
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Signup</title>
    </head>
    <body>
        <h1>Here is sign up page</h1>
        <form action="AuthController" method="post">
            <label>
                <input type="text" name="username" placeholder="Username"/>
            </label>
            <label>
                <input type="password" name="password" placeholder="Password"/>
            </label>
            <input type="submit" value="Signup"/>
        </form>
    </body>
</html>
