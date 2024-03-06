<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="productDetail" value="${requestScope.productDetail}"/>
<c:set var="product" value="${productDetail.product}"/>
<c:set var="productItems" value="${productDetail.productItems}"/>
<c:set var="attributesMap" value="${requestScope.attributesMap}"/>
<c:set var="imageSrc" value="${contextPath}/static/images/products"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
        <title>Product</title>
    </head>
    <body>
        <!-- Hero section -->
        <jsp:include page="/components/header.jsp"/>
        
        <main class="mx-auto w-full px-8 pt-36 pb-24">
            <!-- Product -->
            <div class="grid grid-cols-5 gap-x-8">
                <!-- Image gallery -->
                <div class="col-span-2 flex gap-x-6">
                    <div class="">
                        <!-- Tab panel, show/hide based on tab state. -->
                        <div id="tabs-2-panel-1" aria-labelledby="tabs-2-tab-1" role="tabpanel" tabindex="0">
                            <img src="${imageSrc}/${product.images[0]}"
                                 alt="Angled front view with bag zipped and handles upright."
                                 class="h-full w-full object-cover object-center rounded-lg">
                        </div>
                        
                        <!-- More images... -->
                    </div>
                    
                    <!-- Image selector -->
                    <div class="mx-auto w-full block">
                        <div class="grid grid-rows-3 gap-6" role="tablist">
                            <c:forEach var="image" items="${product.images}">
                                <button id="tabs-2-tab-1"
                                        class="relative flex h-24 cursor-pointer items-center justify-center rounded-md bg-white text-sm font-medium uppercase text-gray-900 hover:bg-gray-50 focus:outline-none focus:ring focus:ring-opacity-50 focus:ring-offset-4"
                                        aria-controls="tabs-2-panel-1" role="tab" type="button">
                                    <span class="sr-only"> Angled view </span>
                                    <span class="absolute inset-0 overflow-hidden rounded-md">
                  <img src="${imageSrc}/${image}" alt=""
                       class="h-full w-full object-cover object-center"></span>
                                    
                                    <!-- Selected: "ring-indigo-500", Not Selected: "ring-transparent" -->
                                    <span class="ring-transparent pointer-events-none absolute inset-0 rounded-md ring-2 ring-offset-2"
                                          aria-hidden="true"></span>
                                </button>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                
                <!-- Product info -->
                <div class="col-span-3 px-4 mt-0">
                    <h1 class="text-2xl font-bold tracking-tight text-gray-900">${product.name}</h1>
                    
                    <%-- Price --%>
                    <div class="mt-3">
                        <p class="text-xl tracking-tight text-gray-900">${product.price}</p>
                    </div>
                    
                    <!-- Stars -->
                    <div class="mt-3">
                        <div class="flex items-center">
                            <div class="flex items-center">
                                <!--
                                  Heroicon name: mini/star
                
                                  Active: "text-indigo-500", Inactive: "text-gray-300"
                                -->
                                <c:forEach var="i" begin="1" end="5" step="1">
                                    <!-- Heroicon name: mini/star -->
                                    <svg class="h-5 w-5 flex-shrink-0 text-indigo-500"
                                         xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                         aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    
                    <%-- Classification --%>
                    <form class="mt-6">
                        <!-- Sizes -->
                        <c:forEach var="entry" items="${attributesMap}">
                            <div>
                                <fieldset>
                                    <legend class="text-gray-900 font-semibold">Choose ${entry.key}</legend>
                                    <div class="grid grid-cols-5 gap-4 mt-3">
                                        <c:forEach var="value" items="${entry.value}" varStatus="status">
                                            <!-- Active: "ring-2 ring-indigo-500" -->
                                            <label class="col-span-1 group relative border rounded-md py-3 px-4 flex items-center justify-center text-sm font-medium uppercase hover:bg-gray-50 focus:outline-none bg-white shadow-sm text-gray-900 cursor-pointer">
                                                <input type="radio" name="${entry.key}-choice" value="${value}"
                                                       class="sr-only"
                                                       aria-labelledby="${entry.key}-choice-${status.index}-label">
                                                <span id="${entry.key}-choice-${status.index}-label">${value}</span>
                                                <!--
                                             Active: "border", Not Active: "border-2"
                                             Checked: "border-indigo-500", Not Checked: "border-transparent"
                                           -->
                                                <span class="pointer-events-none absolute -inset-px rounded-md"
                                                      aria-hidden="true"></span>
                                            </label>
                                        </c:forEach>
                                    </div>
                                </fieldset>
                            </div>
                        </c:forEach>
                        
                        <div class="flex gap-6 items-center">
                            <button type="submit"
                                    class="mt-10 flex w-max items-center justify-center rounded-md border border-transparent bg-indigo-600 py-3 px-8 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                                Buy now
                            </button>
                            <button type="submit"
                                    class="mt-10 flex w-max items-center justify-center rounded-md border border-transparent bg-indigo-600 py-3 px-8 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                                Add to cart
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Description and details -->
            <div class="px-8 pt-8 w-4/6">
                <div>
                    <div class="space-y-6">
                        <h1 class="text-2xl font-bold tracking-tight text-gray-900">Product Description</h1>
                        
                        <p class="text-base text-gray-900">${product.description}</p>
                    </div>
                </div>
            </div>
        </main>
        
        <%@ include file="/components/footer.jsp" %>
        
        <script>
            const contextPath = '<%= request.getContextPath() %>';
        </script>
        <%--        <script src="${contextPath}/static/js/category.js"></script>--%>
    </body>
</html>
