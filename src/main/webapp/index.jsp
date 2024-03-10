<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Unimart</title>
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
    </head>
    <body>
        
        <jsp:include page="/components/alert.jsp"/>
        <jsp:include page="/components/header.jsp"/>
        
        <main class="mb-8 mx-auto">
            <!-- Category section -->
            <section aria-labelledby="category-heading" class="pt-36 mx-auto max-w-7xl px-8">
                <div class="flex items-center justify-between px-8">
                    <h2 id="category-heading" class="text-2xl font-bold tracking-tight text-gray-900">Shop by
                        Category</h2>
                    <a href="${contextPath}/categories"
                       class="font-semibold text-indigo-600 hover:text-indigo-500 block">
                        Browse all categories
                        <span aria-hidden="true"> &rarr;</span>
                    </a>
                </div>
                
                <div class="mt-4 flow-root">
                    <div class="relative py-2 overflow-visible">
                        <div id="category-container" class="relative grid grid-cols-8 gap-x-[12rem] px-8">
                        </div>
                    </div>
                </div>
            
            </section>
            
            <!-- Advertisement section -->
            <section aria-labelledby="community-deals-heading"
                     class="mx-auto max-w-7xl pt-24 px-8">
                <div class="relative overflow-hidden rounded-lg">
                    <div class="absolute inset-0">
                        <img src="${contextPath}/static/images/advertisements/advertise-1.jpg"
                             alt="Students exchanging books and gadgets at the university campus"
                             class="h-full w-full object-cover object-center">
                    </div>
                    <div class="relative bg-gray-900 bg-opacity-75 py-8 px-16">
                        <div class="relative mx-auto flex max-w-3xl flex-col items-center text-center">
                            <h2 id="community-deals-heading"
                                class="text-3xl font-bold tracking-tight text-white">
                                <span class="block">Connect, Exchange,</span>
                                <span class="block">Empower Your Studies</span>
                            </h2>
                            <p class="mt-3 text-xl text-white leading-8">Find everything you need for your
                                university life,
                                from textbooks to tech. Share resources with peers, save money, and make the most of
                                your campus experience. Sustainable, smart, and student-focused. Unimart is your
                                marketplace.</p>
                            <a href="${contextPath}/categories"
                               class="mt-8 block rounded-md border border-transparent bg-white py-3 px-8 font-medium text-gray-900 hover:bg-gray-100 w-auto">Start
                                Buying Now</a>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- Product section -->
            <section aria-labelledby="daily-products"
                     class="mx-auto px-16 pt-24 max-w-full">
                <h2 id="daily-products" class="text-2xl font-bold tracking-tight text-gray-900">Daily
                    Products</h2>
                <p class="mt-4 mb-8 text-gray-500">Every day we discuss with representatives of student
                    associations to come up with the most suitable products</p>
                
                <jsp:include page="/components/product.jsp"/>
            </section>
        </main>
        
        <%@ include file="/components/footer.jsp" %>
        
        <script type="text/javascript">
            const contextPath = "${pageContext.request.contextPath}";
        </script>
        <script src="${pageContext.request.contextPath}/static/js/index.js"></script>
    </body>
</html>
