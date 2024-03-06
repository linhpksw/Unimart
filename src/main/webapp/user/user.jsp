<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="user" value="${sessionScope.user}"/>
<c:set var="errorMessage" value="${sessionScope.errorMessage}"/>
<c:set var="requestURI" value="${pageContext.request.requestURI}"/>
<c:set var="currentPath" value="${requestScope.logicalURI}"/>

<c:set var="root" value="${pageContext.request.contextPath}"/>


<%--<jsp:include page="/components/log.jsp?log=${currentPath}"/>--%>

<!DOCTYPE html>
<html class="h-full bg-white">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Unimart</title>
        <link rel="stylesheet" href="${root}/static/css/tailwind.css"/>
        <jsp:include page="/components/alert.jsp"/>
    </head>
    
    <body class="h-full overflow-hidden">
        <!-- Hero section -->
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
                                    </c:when>
                                    <c:when test="${currentPath.contains('/user/add')}">
                                        <!-- Add product area-->
                                        <jsp:include page="/seller/add.jsp"/>
                                    </c:when>
                                    <c:when test="${currentPath.contains('/user/all')}">
                                        <!-- Show all product area-->
                                        <jsp:include page="/seller/product.jsp"/>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <!-- End main area -->
                    </main>
                </div>
            </div>
        </div>
        
        <script src="${root}/static/js/add.js"></script>
        <script src="${root}/static/js/user.js"></script>
    </body>
</html>
