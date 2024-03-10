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
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
        <title>Category</title>
    </head>
    <body>
        <jsp:include page="/components/alert.jsp"/>
        <jsp:include page="/components/header.jsp"/>
        
        <main class="mx-auto max-w-7xl px-8 pt-12">
            <%-- Page title --%>
            <div class="flex items-baseline justify-between border-b border-gray-200 pt-24 pb-10">
                <div>
                    <h1 class="text-4xl font-bold tracking-tight text-gray-900">All Categories</h1>
                    <p class="mt-4 text-base text-gray-500">Checkout out the latest release of Basic Tees, new and
                        improved with four openings!</p>
                </div>
            </div>
            
            <div class="pt-12 pb-24 grid grid-cols-12">
                <%-- Filter area --%>
                <aside class="col-span-2">
                    <h2 class="sr-only">Filters</h2>
                    
                    <div class="block">
                        <form class="space-y-10 divide-y divide-gray-200">
                            <%-- Sort area --%>
                            <div>
                                <fieldset>
                                    <legend class="block text-sm font-medium text-gray-900">Sort</legend>
                                    <div id="sort-container" class="space-y-3 pt-6"></div>
                                </fieldset>
                            </div>
                            
                            <%-- Category area --%>
                            <div class="pt-10">
                                <fieldset>
                                    <legend class="block text-sm font-medium text-gray-900">Category</legend>
                                    
                                    <div id="category-container" class="space-y-3 pt-6">
                                    </div>
                                </fieldset>
                            </div>
                        </form>
                    </div>
                </aside>
                
                <%-- Product area --%>
                <section aria-labelledby="product-heading" class="col-span-8 mt-1">
                    <jsp:include page="/components/product.jsp"/>
                </section>
            </div>
        </main>
        
        <%@ include file="/components/footer.jsp" %>
        
        <script>
            const contextPath = '<%= request.getContextPath() %>';
            const selectedSort = '<%= request.getAttribute("selectedSort") %>';
            const selectedCategories = '<%= request.getAttribute("selectedCategories") %>';
        </script>
        <script src="${pageContext.request.contextPath}/static/js/category.js"></script>
    </body>
</html>
