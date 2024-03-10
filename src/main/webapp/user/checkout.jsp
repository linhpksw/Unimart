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
            
            <form action="#" method="get" class="mt-6 grid grid-cols-12 items-start gap-x-12">
                <!-- Cart items -->
                
                <section class="col-span-7">
                    <!-- Cart items list -->
                    <ul id="cart-item-container" class="divide-y divide-gray-200 border-t border-b border-gray-200">
                        <li class="flex py-6">
                            <div class="flex-shrink-0">
                                <img src="${imageSrc}/"
                                     alt=""
                                     class="h-48 w-48 rounded-md object-cover object-center">
                            </div>
                            
                            <div class="ml-4 flex flex-1 flex-col justify-between">
                                <div class="relative pr-9 grid grid-cols-2 gap-x-6">
                                    <div>
                                        <div class="flex justify-between">
                                            <h3 class="text-sm">
                                                <a href="#" class="font-medium text-gray-700 hover:text-gray-800">Basic
                                                    Tee</a>
                                            </h3>
                                        </div>
                                        <div class="mt-1 flex text-sm">
                                            <p class="text-gray-500">Black</p>
                                            
                                            <p class="ml-4 border-l border-gray-200 pl-4 text-gray-500">Large</p>
                                        </div>
                                        <p class="mt-1 text-sm font-medium text-gray-900">$32.00</p>
                                    </div>
                                    
                                    <div class="mt-4 sm:mt-0 sm:pr-9">
                                        <label for="quantity-1" class="sr-only">Quantity, Basic Tee</label>
                                        <input id="quantity-1" name="quantity-1" type="number" min="1" max="8" value="1"
                                               class="max-w-full rounded-md border border-gray-300 py-1.5 text-left text-base font-medium leading-5 text-gray-700 shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500">
                                        
                                        <div class="absolute top-0 right-0">
                                            <button type="button"
                                                    class="-m-2 inline-flex p-2 text-gray-400 hover:text-gray-500">
                                                <span class="sr-only">Remove</span>
                                                <!-- Heroicon name: mini/x-mark -->
                                                <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg"
                                                     viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                    <path d="M6.28 5.22a.75.75 0 00-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 101.06 1.06L10 11.06l3.72 3.72a.75.75 0 101.06-1.06L11.06 10l3.72-3.72a.75.75 0 00-1.06-1.06L10 8.94 6.28 5.22z"></path>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                
                                <p class="mt-4 flex space-x-2 text-sm text-gray-700">
                                    <!-- Heroicon name: mini/clock -->
                                    <svg class="h-5 w-5 flex-shrink-0 text-gray-300"
                                         xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                         aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M10 18a8 8 0 100-16 8 8 0 000 16zm.75-13a.75.75 0 00-1.5 0v5c0 .414.336.75.75.75h4a.75.75 0 000-1.5h-3.25V5z"
                                              clip-rule="evenodd"></path>
                                    </svg>
                                    <span>Ships in 3–4 days</span>
                                </p>
                            </div>
                        </li>
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
                            Checkout
                        </button>
                    </div>
                </section>
            </form>
        </main>
        
        <%@ include file="/components/footer.jsp" %>
        
        <script>
            const imageSrc = '${imageSrc}';
            const contextPath = '${contextPath}';
        </script>
        <script src="${contextPath}/static/js/checkout.js"></script>
    </body>
</html>
