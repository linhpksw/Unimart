<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="requestURI" value="${pageContext.request.requestURI}"/>
<c:set var="currentPath" value="${requestScope.logicalURI}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html class="h-full bg-white">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Unimart</title>
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
    </head>
    
    <body class="h-full overflow-hidden">
        <jsp:include page="/components/alert.jsp"/>
        <jsp:include page="/components/header.jsp"/>
        
        <div class="flex h-full ">
            <jsp:include page="/components/sidebar.jsp"/>
            
            <div class="flex min-w-0 flex-1 flex-col overflow-hidden pt-24">
                <div class="relative z-0 flex flex-1 overflow-hidden">
                    <main class="relative z-0 flex-1 overflow-y-auto focus:outline-none">
                        <!-- Start main area-->
                        <div class="absolute inset-0 py-6 px-8">
                            <div class="rounded-lg border-2 border-dashed border-gray-200">
                                <c:choose>
                                    <c:when test="${currentPath.contains('/user/profile')}">
                                        <!-- Profile area-->
                                        <jsp:include page="/user/profile.jsp"/>
                                        <script src="${contextPath}/static/js/profile.js"></script>
                                    </c:when>
                                    <c:when test="${currentPath.contains('/user/history')}">
                                        <!-- Purchase area-->
                                        <jsp:include page="/user/history.jsp"/>
                                        <script src="${contextPath}/static/js/history.js"></script>
                                    </c:when>
                                    <c:when test="${currentPath.contains('/seller/add')}">
                                        <!-- Add product area-->
                                        <jsp:include page="/seller/add.jsp"/>
                                        <script src="${contextPath}/static/js/add.js"></script>
                                    </c:when>
                                    <c:when test="${currentPath.contains('/seller/stock')}">
                                        <!-- Show all product in stock area-->
                                        <jsp:include page="/seller/stock.jsp"/>
                                        <script src="${contextPath}/static/js/stock.js"></script>
                                    </c:when>
                                    <c:when test="${currentPath.contains('/seller/edit')}">
                                        <!-- Show edit product in stock area-->
                                        <jsp:include page="/seller/edit.jsp"/>
                                        <script src="${contextPath}/static/js/edit.js"></script>
                                    </c:when>
                                    <c:when test="${currentPath.contains('/seller/revenue')}">
                                        <!-- Show edit product in stock area-->
                                        <jsp:include page="/seller/revenue.jsp"/>
                                        <script src="${contextPath}/static/js/revenue.js"></script>
                                    </c:when>
                                    <c:when test="${currentPath.contains('/admin/account')}">
                                        <!-- Show admin area-->
                                        <jsp:include page="/admin/account.jsp"/>
                                        <script src="${contextPath}/static/js/account.js"></script>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </main>
                </div>
            </div>
        </div>
    </body>
</html>
