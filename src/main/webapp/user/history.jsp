<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imageSrc" value="${contextPath}/static/images/products"/>
<c:set var="ordersJson" value="${requestScope.ordersJson}"/>


<main class="py-6 px-4">
    
    <div class="">
        <h1 class="text-2xl font-bold leading-7 text-gray-900">Order history</h1>
    </div>
    
    
    <section class="mt-16">
        <div class="mx-auto max-w-7xl sm:px-2 lg:px-8">
            <div id="orders-container" class="mx-auto space-y-8 max-w-4xl px-0">
                <!-- More orders... -->
            </div>
        </div>
    </section>
</main>

<script>
    const ordersJson = JSON.parse('${ordersJson}');
    const imageSrc = '${imageSrc}';
    const contextPath = '${contextPath}';
</script>
