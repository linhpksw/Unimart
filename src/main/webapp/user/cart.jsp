<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imageSrc" value="${contextPath}/static/images/products"/>
<c:set var="cartJson" value="${requestScope.cartJson}"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart</title>
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
    </head>
    <body class="overflow-x-hidden">
        <jsp:include page="/components/alert.jsp"/>
        <jsp:include page="/components/header.jsp"/>
        
        <main class="mx-auto px-12 pt-32 pb-24">
            <h1 class="text-2xl font-bold tracking-tight text-gray-900">Shopping Cart</h1>
            
            <form action="${contextPath}/cart" method="post" class="mt-6 grid grid-cols-12 items-start gap-x-12">
                <input type="hidden" id="cart-data" name="cart-data" value=""/>
                <!-- Cart items -->
                <section class="col-span-7">
                    <!-- Cart items list -->
                    <ul id="cart-item-container" class="divide-y divide-gray-200 border-t border-b border-gray-200">
                    </ul>
                </section>
                
                <!-- Order summary -->
                <section
                        class="rounded-lg bg-gray-50 pb-6 px-8 col-span-5">
                    <h2 id="summary-heading" class="text-lg font-bold text-gray-900">Order summary</h2>
                    
                    <dl class="mt-6 space-y-4">
                        <div class="flex items-center justify-between">
                            <dt class="text-gray-600">Subtotal</dt>
                            <dd id="subtotal" class="font-medium text-gray-900"></dd>
                        </div>
                        <div class="flex items-center justify-between border-t border-gray-200 pt-4">
                            <dt class="flex items-center text-gray-600">
                                <span>Shipping estimate</span>
                                <a href="#" class="ml-2 flex-shrink-0 text-gray-400 hover:text-gray-500">
                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                         fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM8.94 6.94a.75.75 0 11-1.061-1.061 3 3 0 112.871 5.026v.345a.75.75 0 01-1.5 0v-.5c0-.72.57-1.172 1.081-1.287A1.5 1.5 0 108.94 6.94zM10 15a1 1 0 100-2 1 1 0 000 2z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                </a>
                            </dt>
                            <dd id="shipping" class="font-medium text-gray-900"></dd>
                        </div>
                        <div class="flex items-center justify-between border-t border-gray-200 pt-4">
                            <dt class="flex text-gray-600">
                                <span>Tax estimate</span>
                                <a href="#" class="ml-2 flex-shrink-0 text-gray-400 hover:text-gray-500">
                                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                         fill="currentColor" aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM8.94 6.94a.75.75 0 11-1.061-1.061 3 3 0 112.871 5.026v.345a.75.75 0 01-1.5 0v-.5c0-.72.57-1.172 1.081-1.287A1.5 1.5 0 108.94 6.94zM10 15a1 1 0 100-2 1 1 0 000 2z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                </a>
                            </dt>
                            <dd id="tax" class="font-medium text-gray-900"></dd>
                        </div>
                        <div class="flex items-center justify-between border-t border-gray-200 pt-4">
                            <dt class=" font-medium text-gray-900">Order total</dt>
                            <dd id="total" class=" font-medium text-gray-900"></dd>
                        </div>
                    </dl>
                    
                    <div class="mt-6">
                        <button type="submit"
                                class="w-full rounded-md border border-transparent bg-indigo-600 py-3 px-4 font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">
                            Place order
                        </button>
                    </div>
                </section>
            </form>
        </main>
        
        <%@ include file="/components/footer.jsp" %>
        
        <script>
            const cartJson = JSON.parse('${cartJson}');
            const imageSrc = '${imageSrc}';
            const contextPath = '${contextPath}';
        </script>
        <script src="${contextPath}/static/js/cart.js"></script>
    </body>
</html>
