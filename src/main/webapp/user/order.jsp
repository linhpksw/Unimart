<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imageSrc" value="${contextPath}/static/images/products"/>
<c:set var="orderJson" value="${requestScope.orderJson}"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order</title>
        <link rel="stylesheet" href="${contextPath}/static/css/tailwind.css"/>
    </head>
    <body>
        <jsp:include page="/components/alert.jsp"/>
        <jsp:include page="/components/header.jsp"/>
        
        <main class="mx-auto px-12 pt-32 pb-24">
            <div class="space-y-2 px-4 sm:flex sm:items-baseline sm:justify-between sm:space-y-0 sm:px-0">
                <div class="flex sm:items-baseline sm:space-x-4">
                    <h1 id="order-id-header" class="text-2xl font-bold tracking-tight text-gray-900"></h1>
                </div>
                <p class="text-gray-600">Order placed at
                    <time id="order-date" datetime="" class="font-medium text-gray-900"></time>
                </p>
            </div>
            
            <!-- Products -->
            <section class="mt-6">
                <div class="space-y-8">
                    <div id="items-container" class="border border-gray-200 bg-white shadow-sm rounded-lg">
                        <div class="grid grid-cols-12 gap-x-8 p-6">
                            <div class="flex col-span-7">
                                <%-- Image --%>
                                <div class="w-24 h-24 flex-shrink-0 overflow-hidden rounded-lg ">
                                    <img src="https://tailwindui.com/img/ecommerce-images/confirmation-page-03-product-01.jpg"
                                         alt=""
                                         class="h-full w-full object-cover object-center">
                                </div>
                                
                                <%-- Detail --%>
                                <div class="mt-0 ml-6">
                                    <h3 class="text-base font-medium text-gray-900">
                                        <a href="${contextPath}/product/productId">Nomad Tumbler</a>
                                    </h3>
                                    <p class="mt-2 font-medium text-gray-900">$35.00</p>
                                    <p class="mt-3 text-gray-500">Color | Red</p>
                                </div>
                            </div>
                            
                            <%-- Quantity & store --%>
                            <div class="col-span-5 mt-0">
                                <dl class="grid grid-cols-2 gap-x-6">
                                    <div>
                                        <dt class="font-medium text-gray-900">Quantity</dt>
                                        <dd class="mt-3 text-gray-500">
                                            <span class="block">5</span>
                                        </dd>
                                    </div>
                                    <div>
                                        <dt class="font-medium text-gray-900">Store</dt>
                                        <dd class="mt-3 space-y-3 text-gray-500">
                                            <a href="#">linhpksw</a>
                                        </dd>
                                    </div>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- Billing -->
            <section class="mt-16">
                <div class="bg-gray-100 rounded-lg grid grid-cols-12 gap-x-8 px-8 py-8">
                    <dl class="grid grid-cols-2 gap-6 gap-x-8 col-span-7">
                        <div>
                            <dt class="font-medium text-gray-900">Payment information</dt>
                            <dd class="-ml-4 -mt-1 flex flex-wrap">
                                <div class="ml-4 mt-4 flex-shrink-0">
                                    <svg aria-hidden="true" width="36" height="24" viewBox="0 0 36 24"
                                         xmlns="http://www.w3.org/2000/svg" class="h-6 w-auto">
                                        <rect width="36" height="24" rx="4" fill="#224DBA"></rect>
                                        <path d="M10.925 15.673H8.874l-1.538-6c-.073-.276-.228-.52-.456-.635A6.575 6.575 0 005 8.403v-.231h3.304c.456 0 .798.347.855.75l.798 4.328 2.05-5.078h1.994l-3.076 7.5zm4.216 0h-1.937L14.8 8.172h1.937l-1.595 7.5zm4.101-5.422c.057-.404.399-.635.798-.635a3.54 3.54 0 011.88.346l.342-1.615A4.808 4.808 0 0020.496 8c-1.88 0-3.248 1.039-3.248 2.481 0 1.097.969 1.673 1.653 2.02.74.346 1.025.577.968.923 0 .519-.57.75-1.139.75a4.795 4.795 0 01-1.994-.462l-.342 1.616a5.48 5.48 0 002.108.404c2.108.057 3.418-.981 3.418-2.539 0-1.962-2.678-2.077-2.678-2.942zm9.457 5.422L27.16 8.172h-1.652a.858.858 0 00-.798.577l-2.848 6.924h1.994l.398-1.096h2.45l.228 1.096h1.766zm-2.905-5.482l.57 2.827h-1.596l1.026-2.827z"
                                              fill="#fff"></path>
                                    </svg>
                                    <p class="sr-only">Visa</p>
                                </div>
                                <div class="ml-4 mt-4">
                                    <p class="text-gray-900 text-sm">Ending with 4242</p>
                                    <p class="text-gray-600 text-sm">Expires 02 / 26</p>
                                </div>
                            </dd>
                        </div>
                    </dl>
                    
                    <dl class="divide-y divide-gray-200 col-span-5 mt-0">
                        <div class="flex items-center justify-between pb-4">
                            <dt class="text-gray-600">Subtotal</dt>
                            <dd id="sub-total" class="font-medium text-gray-900"></dd>
                        </div>
                        <div class="flex items-center justify-between py-4">
                            <dt class="text-gray-600">Shipping</dt>
                            <dd id="shipping" class="font-medium text-gray-900"></dd>
                        </div>
                        <div class="flex items-center justify-between py-4">
                            <dt class="text-gray-600">Tax</dt>
                            <dd id="tax" class="font-medium text-gray-900"></dd>
                        </div>
                        <div class="flex items-center justify-between pt-4">
                            <dt class="font-medium text-gray-900">Order total</dt>
                            <dd id="total" class="font-medium text-indigo-600"></dd>
                        </div>
                    </dl>
                </div>
            </section>
        </main>
        
        <%@ include file="/components/footer.jsp" %>
        
        <script>
            const orderJson = JSON.parse('${orderJson}');
            const imageSrc = '${imageSrc}';
            const contextPath = '${contextPath}';
        </script>
        <script src="${contextPath}/static/js/order.js"></script>
    </body>
</html>
