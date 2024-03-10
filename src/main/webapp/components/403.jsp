<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forbidden</title>
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
    </head>
    <body>
        <jsp:include page="/components/header.jsp"/>
        
        <main class="grid min-h-full place-items-center bg-white pt-48 pb-24 px-8">
            <div class="text-center">
                <p class="text-4xl font-semibold text-indigo-600">403</p>
                <h1 class="mt-4 text-5xl font-bold tracking-tight text-gray-900">Access to this page is
                    restricted</h1>
                <p class="mt-6 text-base leading-7 text-gray-600">Please check with the admin if you believe this is a
                    mistake.</p>
                <div class="mt-10 flex items-center justify-center gap-x-6">
                    <a href="${contextPath}"
                       class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Go
                        back home</a>
                    <a href="#" class="text-sm font-semibold text-gray-900">Contact support <span aria-hidden="true">&rarr;</span></a>
                </div>
            </div>
        </main>
        
        <%@ include file="/components/footer.jsp" %>
    </body>
</html>
