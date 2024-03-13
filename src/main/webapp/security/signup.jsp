<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:set var="user" value="${requestScope.user}"/>

<c:if test="${user != null}">
    <c:set var="id" value="${user.id}"/>
    <c:set var="password" value="${user.password}"/>
    <c:set var="email" value="${user.email}"/>
    <c:set var="phone" value="${user.phone}"/>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
        <title>Login</title>
    </head>
    <body class="h-full">
        <jsp:include page="/components/alert.jsp"/>
        <div class="flex min-h-full">
            <div class="flex flex-1 flex-col justify-center px-4 sm:px-6 lg:flex-none lg:px-20 xl:px-24">
                <div class="mx-auto w-full max-w-sm lg:w-96">
                    <div>
                        <h2 class="mt-2 text-3xl font-bold tracking-tight text-gray-900">Sign up to your
                            account</h2>
                        <p class="mt-2 text-sm text-gray-600">
                            Already on Unimart?
                            <a href="login" class="font-medium text-indigo-600 hover:text-indigo-500">Log in now!</a>
                        </p>
                    </div>
                    
                    <div class="mt-8">
                        <div class="">
                            <form action="signup" method="POST" class="space-y-6">
                                <div>
                                    <label for="id"
                                           class="block text-sm font-medium text-gray-700">Username</label>
                                    <div class="mt-1">
                                        <input id="id" name="id" type="text" autocomplete="username"
                                               value="${id}"
                                               required
                                               class="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                </div>
                                
                                <div class="space-y-1">
                                    <label for="email"
                                           class="block text-sm font-medium text-gray-700">Email</label>
                                    <div class="mt-1">
                                        <input id="email" name="email" type="email" autocomplete="email"
                                               value="${email}"
                                               required
                                               class="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                
                                </div>
                                
                                <div class="space-y-1">
                                    <label for="phone"
                                           class="block text-sm font-medium text-gray-700">Phone</label>
                                    <div class="mt-1">
                                        <input id="phone" name="phone" type="text" autocomplete="phone"
                                               required
                                               value="${phone}"
                                               class="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                </div>
                                
                                <div class="space-y-1">
                                    <label for="password"
                                           class="block text-sm font-medium text-gray-700">Password</label>
                                    <div class="mt-1">
                                        <input id="password" name="password" type="password"
                                               value="${password}"
                                               autocomplete="current-password" required
                                               class="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                </div>
                                
                                <div class="text-sm">
                                    <span class="text-sm font-medium text-gray-700">By
                                        clicking Sign up now, you agree to <a href="#"
                                                                              class="font-medium text-indigo-600 hover:text-indigo-500">Unimart's User Agreement</a> and <a
                                                href="#" class="font-medium text-indigo-600 hover:text-indigo-500">Privacy
                                        Policy</a>.</span>
                                
                                </div>
                                
                                <div>
                                    <button type="submit"
                                            class="flex w-full justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                                        Sign up now
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="relative hidden w-0 flex-1 lg:block h-screen">
                <img class="absolute inset-0 h-screen w-full object-cover"
                     src="${contextPath}/static/images/login-cover.jpg"
                     alt="">
            </div>
        </div>
    </body>
</html>
