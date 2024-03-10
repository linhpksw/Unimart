<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imageSrc" value="${contextPath}/static/images/products"/>

<c:set var="productDetail" value="${requestScope.productDetail}"/>
<c:set var="product" value="${productDetail.product}"/>

<c:set var="productDetailJson" value="${requestScope.productDetailJson}"/>
<c:set var="productItemsJson" value="${requestScope.productItemsJson}"/>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
        <title>Product</title>
    </head>
    <body>
        <jsp:include page="/components/alert.jsp"/>
        <jsp:include page="/components/header.jsp"/>
        
        <main class="mx-auto w-full px-8 pt-36 pb-24">
            <!-- Product -->
            <div class="grid grid-cols-5 gap-x-8">
                <!-- Image gallery -->
                <div class="col-span-2 flex gap-x-6">
                    <!-- Tab panel, show/hide based on tab state. -->
                    <div class="w-[320%] h-[27rem]" id="tabs-2-panel-1" aria-labelledby="tabs-2-tab-1" role="tabpanel"
                         tabindex="0">
                        <img src="${imageSrc}/${product.images[0]}"
                             class="h-full w-full object-cover object-center rounded-lg" alt="">
                    </div>
                    
                    <!-- Image selector -->
                    <div class="mx-auto w-full block">
                        <div class="grid grid-rows-3 gap-6" role="tablist">
                            <c:forEach var="image" items="${product.images}">
                                <button id="tabs-2-tab-1"
                                        class="relative flex h-24 cursor-pointer items-center justify-center rounded-md bg-white text-sm font-medium uppercase text-gray-900 hover:bg-gray-50 focus:outline-none focus:ring focus:ring-opacity-50 focus:ring-offset-4"
                                        aria-controls="tabs-2-panel-1" role="tab" type="button">
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
                <form action="${contextPath}/product" id="product-info-container" method="post"
                      class="col-span-3 px-4 mt-0">
                    <h1 id="product-name" class="text-2xl font-bold tracking-tight text-gray-900">${product.name}</h1>
                    
                    <input type="hidden" name="productId" value="${product.id}">
                    <input type="hidden" name="name" value="${product.name}">
                    <input type="hidden" name="storeId" value="${product.storeId}">
                    <input type="hidden" name="imageName" value="${product.images[0]}">
                    <input type="hidden" id="product-item-id" name="productItemId" value="">
                    
                    <!-- Stars -->
                    <div class="mt-1">
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
                    
                    <!-- Price Range -->
                    <div class="mt-5">
                        <p id="price-range" class="text-2xl tracking-tight text-gray-800"></p>
                    </div>
                    
                    <!-- Options -->
                    <div id="options-container"></div>
                    
                    <!-- Total Stock -->
                    <div class="mt-6 flex items-center gap-4">
                        <label for="quantity"
                               class="block w-max font-medium leading-6 text-gray-600">Quantity</label>
                        <input type="number" name="quantity" id="quantity" required
                               class="block w-18 rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600">
                        
                        <p id="total-stock" class="block font-medium leading-6 tracking-tight text-gray-600">Total
                            stock: ${totalStock}</p>
                    </div>
                    
                    <div class="flex gap-6 items-center">
                        <button type="submit" name="action" value="buyNow"
                                class="mt-10 flex w-max items-center justify-center rounded-md border border-transparent bg-indigo-600 py-3 px-8 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                            Buy now
                        </button>
                        <button type="submit" name="action" value="addToCart"
                                class="mt-10 flex w-max items-center justify-center rounded-md border border-transparent bg-indigo-600 py-3 px-8 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                            Add to cart
                        </button>
                    </div>
                </form>
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
            const productDetailJson = JSON.parse('${productDetailJson}');
            const productItemsJson = JSON.parse('${productItemsJson}');
        </script>
        <script src="${contextPath}/static/js/product.js"></script>
    </body>
</html>
