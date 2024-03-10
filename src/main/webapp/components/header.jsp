<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="fixed z-50 bg-purple-600 w-full">
    <!-- Navigation -->
    <header class="relative z-10">
        <nav aria-label="Top">
            <!-- Top navigation -->
            <div class="bg-gray-900">
                <div class="mx-auto flex h-10 max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
                    <!-- Language selector -->
                    <form>
                        <div>
                            <label for="language" class="sr-only">Language</label>
                            <div class="group relative -ml-2 rounded-md border-transparent bg-gray-900 focus-within:ring-2 focus-within:ring-white">
                                <select id="language" name="language"
                                        class="flex items-center rounded-md border-transparent bg-gray-900 bg-none py-0.5 pl-2 pr-5 text-sm font-medium text-white focus:border-transparent focus:outline-none focus:ring-0 group-hover:text-gray-100">
                                    <option>English</option>
                                    <option>Tiếng Việt</option>
                                </select>
                                <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center">
                                    <!-- Heroicon name: mini/chevron-down -->
                                    <svg class="h-5 w-5 text-gray-300" xmlns="http://www.w3.org/2000/svg"
                                         viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                    <div class="flex items-center space-x-6">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <!-- User is logged in -->
                                <div class="group relative">
                                    <span class="text-sm font-medium text-white">Hello, ${sessionScope.user.id}</span>
                                    <!-- Profile dropdown -->
                                    <div class="hidden group-hover:block absolute right-0 z-10 w-36 origin-top-right bg-white shadow-lg ring-1 ring-black ring-opacity-5 opacity-0 group-hover:opacity-100 transition-opacity duration-200 ease-in-out">
                                        <a href="${pageContext.request.contextPath}/user/profile"
                                           class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100">My
                                            Profile</a>
                                        <a href="${pageContext.request.contextPath}/user/history"
                                           class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100">My
                                            purchase</a>
                                    </div>
                                </div>
                                <a href="${pageContext.request.contextPath}/logout"
                                   class="text-sm font-medium text-white hover:text-gray-100">Logout</a>
                            </c:when>
                            <c:otherwise>
                                <!-- No user in session, show login and sign up -->
                                <a href="${pageContext.request.contextPath}/login"
                                   class="text-sm font-medium text-white hover:text-gray-100">Sign
                                    in</a>
                                <a href="${pageContext.request.contextPath}/signup"
                                   class="text-sm font-medium text-white hover:text-gray-100">Create
                                    an
                                    account</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <!-- Secondary navigation -->
            <div class="bg-white bg-opacity-10 backdrop-blur-md backdrop-filter">
                <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div>
                        <div class="flex h-16 items-center justify-between">
                            <!-- Logo (lg+) -->
                            <div class="flex flex-1 items-center">
                                <a href="${pageContext.request.contextPath}/">
                                    <span class="sr-only">Unimart</span>
                                    <img class="h-8 w-auto"
                                         src="https://tailwindui.com/img/logos/mark.svg?color=white" alt="">
                                </a>
                            </div>
                            
                            <div>
                                <form method="get" action="${contextPath}/categories" class="flex w-96">
                                    <label for="search" class="sr-only">Search</label>
                                    <input id="search" type="text" name="search" autocomplete="search" required
                                           placeholder="Search Pets, Living..."
                                           class="w-full min-w-0 appearance-none rounded-md bg-white py-2 px-4 text-base text-gray-900 placeholder-gray-500 shadow-sm focus:outline-none">
                                    <div class="ml-4 flex-shrink-0">
                                        <button type="submit"
                                                class="flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none">
                                            Search
                                        </button>
                                    </div>
                                </form>
                            </div>
                            
                            <div class="flex flex-1 items-center justify-end">
                                <div class="flex items-center lg:ml-8">
                                    <!-- Dashboard -->
                                    <a href="${contextPath}/user/profile"
                                       class="font-medium text-white block">Dashboard</a>
                                    
                                    <!-- Cart -->
                                    <div class="flow-root ml-8">
                                        <a href="${contextPath}/cart" class="group -m-2 flex items-center p-2">
                                            <!-- Heroicon name: outline/shopping-bag -->
                                            <svg class="h-6 w-6 flex-shrink-0 text-white"
                                                 xmlns="http://www.w3.org/2000/svg" fill="none"
                                                 viewBox="0 0 24 24" stroke-width="1.5"
                                                 stroke="currentColor" aria-hidden="true">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                      d="M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"></path>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>
</div>
