<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:set var="credential" value="${requestScope.credential}"/>
<c:set var="password" value="${requestScope.password}"/>
<c:set var="remember" value="${requestScope.remember}"/>


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
                        <img class="h-12 w-auto"
                             src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"
                             alt="Your Company">
                        <h2 class="mt-6 text-3xl font-bold tracking-tight text-gray-900">Log in to your
                            account</h2>
                        <p class="mt-2 text-sm text-gray-600">
                            New to Unimart?
                            <a href="signup" class="font-medium text-indigo-600 hover:text-indigo-500">Sign up now!</a>
                        </p>
                    </div>
                    
                    <div class="mt-8">
                        <div class="">
                            <form action="login" method="POST" class="space-y-6">
                                <div>
                                    <label for="credential" class="block text-sm font-medium text-gray-700">Phone number
                                        / Username / Email</label>
                                    <div class="mt-1">
                                        <input id="credential" name="credential" type="text" autocomplete="email"
                                               required
                                               value="${credential}"
                                               class="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                </div>
                                
                                <div class="space-y-1">
                                    <label for="password"
                                           class="block text-sm font-medium text-gray-700">Password</label>
                                    <div class="mt-1">
                                        <input id="password" name="password" type="password"
                                               autocomplete="current-password" required
                                               value="${password}"
                                               class="block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm">
                                    </div>
                                </div>
                                
                                <div class="flex items-center justify-between">
                                    <div class="flex items-center">
                                        <input id="remember" name="remember"
                                               type="checkbox" ${remember == 'on' ? 'checked' : ''}
                                               class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
                                        <label for="remember" class="ml-2 block text-sm text-gray-900">Remember
                                            me</label>
                                    </div>
                                    
                                    <div class="text-sm">
                                        <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500">Forgot
                                            your password?</a>
                                    </div>
                                </div>
                                
                                <div>
                                    <button type="submit"
                                            class="flex w-full justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                                        Sign in
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="relative hidden w-0 flex-1 lg:block h-screen">
                <img class="absolute inset-0 h-screen w-full object-cover"
                     src="${pageContext.request.contextPath}/static/images/login-cover.jpg"
                     alt="">
            </div>
        </div>
    </body>
</html>
